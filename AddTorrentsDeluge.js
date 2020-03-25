// ==UserScript==
// @description   Add torrents to Deluge via Web API (requires patched deluge-web and ViolentMonkey)
// @downloadURL   https://raw.githubusercontent.com/lalbornoz/AddTorrentsDelugeTransmission/master/AddTorrentsDeluge.js
// @grant         GM.xmlHttpRequest
// @homepageURL   https://github.com/lalbornoz/AddTorrentsDelugeTransmission
// @include       *
// @license       MIT
// @name          Add torrents to Deluge via Web API
// @namespace     https://greasyfork.org/users/467795
// @supportURL    https://github.com/lalbornoz/AddTorrentsDelugeTransmission
// @version       1.6
// ==/UserScript==

/*
 * Tunables
 */
let debug = false;
let delugeDownloadDir = {
  "": "/var/lib/deluge/downloads"
};
let delugeHostId = "";
let delugeHttpAuthPassword = ""; // (optional)
let delugeHttpAuthUsername = ""; // (optional)
let delugeTorrentDirectory = "/var/lib/deluge/torrents";
let delugeWebPassword = "";
let delugeWebUrl = "protocol://hostname[:port]/deluge";
let linkOpacity = 0.5;

// {{{ Module variables
let delugeRequestId = 0;
// }}}

// {{{ function basename(url)
function basename(url) {
  let url_ = url.split("/");
  return url_[url_.length - 1];
};
// }}}
// {{{ function delugeWebRequest(method, onLoadCb, params)
function delugeWebRequest(method, onLoadCb, params) {
  let headers = {"Content-type": "application/json"};
  let paramsJson = JSON.stringify(params);
  let xhrParams = {
    anonymous:    false,
    data:         '\{"method":"' + method + '","params":' + paramsJson + ',"id":' + (delugeRequestId++) + '\}',
    headers:      headers,
    method:       "POST",
    onload:       function (xhr) {
                    let response = null;
                    try {
                      response = JSON.parse(xhr.responseText);
                    }
                    catch (error) {
                      logError("Error parsing response from server as JSON: "
                               + xhr.responseText);
                    };
                    if (response.error === null) {
                      logDebug("Asynchronous `" + method
                               + "' Web API request succeeded w/ response="
                               + JSON.stringify(response));
                    } else {
                      logError("Asynchronous `" + method
                               + "' Web API request failed: " + response.error.message
                               + " (code " + response.error.code.toString() + ")");
                    };
                    onLoadCb(response, xhr);
                  },
    synchronous:  false,
    url:          delugeWebUrl + "/json"
  };
  if ((delugeHttpAuthPassword !== "")
  &&  (delugeHttpAuthUsername !== "")) {
    xhrParams["password"] = delugeHttpAuthPassword;
    xhrParams["user"] = delugeHttpAuthUsername;
  };
  logDebug("POSTing asynchronous `" + method + "' Web API request to " + xhrParams["url"]
           + " (JSON-encoded parameters: " + paramsJson + ")");
  GM.xmlHttpRequest(xhrParams);
};
// }}}
// {{{ function isMagnetLink(url)
function isMagnetLink(url) {
  if (url.match(/^magnet:/i)) {
    return true;
  } else {
    return false;
  };
};
// }}}
// {{{ function isTorrentLink(url)
function isTorrentLink(url) {
  if (url.match(/\.torrent(\?.*|)$/i)) {
    return true;
  } else {
    return false;
  };
};
// }}}
// {{{ function JavaScriptIsFuckingGarbage(SodOff)
function JavaScriptIsFuckingGarbage(SodOff) {
  return decodeURI(SodOff).replace(/\+/g, " ");
};
// }}}
// {{{ function JavaScriptIsFuckingRubbish()
function JavaScriptIsFuckingRubbish() {
  if(window.Prototype) {
    logDebug("Prototype.js detected, deleting possibly broken {Object,Array,Hash,String}.prototype.toJSON() functions");
    delete Object.prototype.toJSON;
    delete Array.prototype.toJSON;
    delete Hash.prototype.toJSON;
    delete String.prototype.toJSON;
  };
};
// }}}
// {{{ function JavaScriptIsFuckingWorthless(FuckYou)
function JavaScriptIsFuckingWorthless(FuckYou) {
  return btoa(new Uint8Array(FuckYou).reduce(
    function(data, byte) {
      return data + String.fromCharCode(byte);
    }, ""));
};
// }}}
// {{{ function logDebug(msg)
function logDebug(msg) {
  if (debug) {
    console.log("[Deluge] " + msg);
  };
};
// }}}
// {{{ function logError(msg)
function logError(msg) {
  logDebug(msg);
  alert("[Deluge] " + msg);
};
// }}}
// {{{ function logInfo(msg)
function logInfo(msg) {
  logDebug(msg);
  alert("[Deluge] " + msg);
};
// }}}
// {{{ function matchHostDict(dict, host)
function matchHostDict(dict, host) {
  let hostDomain = host.split(".").slice(-2);
  if (host in dict) {
    return dict[host];
  } else if (hostDomain in dict) {
    return dict[hostDomain];
  } else {
    return dict[""];
  };
};
// }}}

// {{{ function cbClickMagnet(e)
function cbClickMagnet(e) {
  let torrentUrl = this.href;
  if (e.ctrlKey) {
    logDebug("Ignoring " + torrentUrl + " due to <Ctrl> modifier.");
  } else {
    e.stopPropagation(); e.preventDefault();
    let torrentName = torrentUrl.match(/dn=([^&]+)/);
    if (torrentName === null) {
      logError("Invalid Magnet URI (missing Display Name)");
    } else {
      torrentName = JavaScriptIsFuckingGarbage(torrentName[1]);
      delugeWebRequest("auth.login",
                       function (response, xhr_) {
                         cbWebLoginResponse(response, null, delugeDownloadDir[""],
                                            torrentName, torrentUrl, null, xhr_);
                       }, [delugeWebPassword]);
    };
  };
};
// }}}
// {{{ function cbClickTorrent(e)
function cbClickTorrent(e) {
  let torrentUrl = this.href;
  if (e.ctrlKey) {
    logDebug("Ignoring " + torrentUrl + " due to <Ctrl> modifier.");
  } else {
    e.stopPropagation(); e.preventDefault();
    let torrentUrlHost = torrentUrl.match(new RegExp("^[^:]+://(?:[^:]+:[^@]+@)?([^/:]+)"));
    if (torrentUrlHost === null) {
      logDebug("Failed to obtain hostname from BitTorrent URL " + torrentUrl);
    } else {
      torrentUrlHost = torrentUrlHost[1];
      let torrentDownloadDir = "";
      if ((torrentDownloadDir = matchHostDict(delugeDownloadDir, torrentUrlHost)) === null) {
        torrentDownloadDir = delugeDownloadDir[""];
      };
      logDebug("Sending asynchronous GET request for " + torrentUrl);
      GM.xmlHttpRequest({
        method:             "GET",
        onreadystatechange: function (xhr) {
                              cbClickResponse(xhr.response, torrentDownloadDir,
                                              basename(torrentUrl), torrentUrl,
                                              torrentUrlHost, xhr);
                            },
        responseType:       "arraybuffer",
        synchronous:        false,
        url:                torrentUrl
      });
    };
  };
};
// }}}
// {{{ function cbClickResponse(torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr)
function cbClickResponse(torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr) {
  logDebug("Asynchronous GET request for " + torrentUrl
           + " readyState=" + xhr.readyState + " status=" + xhr.status);
  if (xhr.readyState === 4) {
    if (xhr.status === 200) {
      delugeWebRequest("auth.login",
                       function (response, xhr_) {
                         cbWebLoginResponse(response, torrent, torrentDownloadDir,
                                            torrentName, torrentUrl, torrentUrlHost, xhr_);
                       }, [delugeWebPassword]);
    } else {
      logDebug("Asynchronous GET request for " + torrentUrl
               + " failed w/ status=" + xhr.status);
    };
  };
};
// }}}
// {{{ function cbWebLoginResponse(response, torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr)
function cbWebLoginResponse(response, torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr) {
  if (response.error === null) {
    delugeWebRequest("web.connect",
                     function (response_, xhr_) {
                       cbWebConnectResponse(response_, torrent, torrentDownloadDir,
                                            torrentName, torrentUrl, xhr_);
                     }, [delugeHostId]);
  };
};
// }}}
// {{{ function cbWebConnectResponse(response, torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr)
function cbWebConnectResponse(response, torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr) {
  if (response.error === null) {
    delugeWebRequest("web.get_config",
                     function (response_, xhr_) {
                       cbWebGetConfigResponse(response_, torrent, torrentDownloadDir,
                                              torrentName, torrentUrl, xhr_);
                     }, []);
  };
};
// }}}
// {{{ function cbWebGetConfigResponse(response, torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr)
function cbWebGetConfigResponse(response, torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr) {
  if (response.error === null) {
    let params = [{options: {"download_location": torrentDownloadDir}}];
    if (isMagnetLink(torrentUrl)) {
      params[0]["path"] = torrentUrl;
    } else {
      params[0]["data"] = JavaScriptIsFuckingWorthless(torrent);
      params[0]["path"] = delugeTorrentDirectory + "/" + torrentName;
    };
    delugeWebRequest("web.add_torrents",
                     function (response_, xhr_) {
                       cbWebAddTorrentsResponse(response_, torrent, torrentDownloadDir,
                                                torrentName, torrentUrl, torrentUrlHost, xhr_);
                     }, [params]);
  };
};
// }}}
// {{{ function cbWebAddTorrentsResponse(response, torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr)
function cbWebAddTorrentsResponse(response, torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr) {
  if (response.error === null) {
    logInfo("Torrent `" + torrentName + "' added successfully.");
  };
};
// }}}

function main() {
  logDebug("Entry point");
  JavaScriptIsFuckingRubbish();
  for (let link of document.links) {
    if (isMagnetLink(link.href)) {
      link.addEventListener("click", cbClickMagnet, true);
      link.style.opacity = linkOpacity;
      logDebug("Registered Magnet link " + link.href);
    } else if (isTorrentLink(link.href)) {
      link.addEventListener("click", cbClickTorrent, true);
      link.style.opacity = linkOpacity;
      logDebug("Registered BitTorrent link " + link.href);
    };
  };
};

main();

// vim:expandtab fileformat=dos sw=2 ts=2
