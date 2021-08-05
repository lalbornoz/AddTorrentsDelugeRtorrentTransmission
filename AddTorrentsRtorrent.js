// ==UserScript==
// @description   Add torrents to rtorrent via XML-RPC API (requires ViolentMonkey)
// @downloadURL   https://raw.githubusercontent.com/lalbornoz/AddTorrentsRtorrentTransmission/master/AddTorrentsRtorrent.js
// @grant         GM.xmlHttpRequest
// @homepageURL   https://github.com/lalbornoz/AddTorrentsRtorrentTransmission
// @include       *
// @license       MIT
// @name          Add torrents to rtorrent via XML-RPC API
// @namespace     https://greasyfork.org/users/467795
// @supportURL    https://github.com/lalbornoz/AddTorrentsRtorrentTransmission
// @version       1.0
// ==/UserScript==

/*
 * Tunables
 */
let debug = true;                                         // debugging output on console
let rtorrentStartOnAdd = true;                            // start torrents on adding
let rtorrentDownloadDir = {                               // {host,domain}-indexed download directory map
//  "domain.tld": "/var/lib/_rtorrent/download.domain.tld",
//  "host.domain.tld": "/var/lib/_rtorrent/download.host.domain.tld",
  "": "/var/lib/_rtorrent/download",
};
let rtorrentHttpAuth = {                                  // HTTP basic auth username & password (optional)
  "username": "",
  "password": "",
};

let rtorrentMethods = {                                   // rtorrent XML-RPC API method name map
  "magnet":   {false: "load.normal",  true: "load.start"},
  "torrent":  {false: "load.raw",     true: "load.raw_start"},
};
let rtorrentWebUrl = "https://<HOSTNAME>[:<PORT>]/RPC2";  // URL to rtorrent XML-RPC API (MUST BE SPECIFIED)

// {{{ Images
let images = {
  "progress0":      'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAWCAYAAACCAs+RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAABmSURBVFhH7ZbBCcBACAQ1dVm+fSXxMJCQK2BXdl6KHwcV9PPGBrBE3L1TTmoWR8f0jBH5rVaNiYWn7+p5K5KZnX2JCKjaW0Q3goZE0JAIGhJBQyJojBGZ+zQyUiK6ETTWanVMjNkFC/lGCoFaJLkAAAAASUVORK5CYII=',
  "progress1":      'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAWCAYAAACCAs+RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAB2SURBVFhH7ZbBDYAwCEXBVVyDFXTYugJrOItKg4mNng2Q/0789MILkJSPCypAF2FmjzmxWUxep6eMyGu1bExZuPu2nj9F5rZ4GtnXjVTV04iI/P72FMGNRAMi0YBINCASDYhEo4xI3U9jRkwENxKNvlpeJ4boBO/6Rgr3rj+kAAAAAElFTkSuQmCC',
  "progress2":      'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAWCAYAAACCAs+RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAB3SURBVFhH7ZbRCYBQCEW1VVrDFWrYWsE1mqXyYdCj6C+4iudL8ceDCvJ+QgloIszsaUxsFoPH4Ukj8lgtG1MUrr6t51eRcZk869nm9bOmqp71iMgvtbtI3QgaJYJGiaBRImiUCBppRPI+jRExkboRNNpqeRwYogPUCkYKdeMSDAAAAABJRU5ErkJggg==',
  "progress3":      'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAWCAYAAACCAs+RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAAB0SURBVFhH7ZbBDYBACATBVmyDFrRYbYE2rEXlgg+ibwNk58XmPkyA5Pi8oQYMEWb2WBObxeR1edqIvFbLxlSFp2/r+VNk3hZPkWPdf39TVU8REQkiuJFsQCQbEMkGRLIBkWy0Een7aayIieBGsjFWy+vCEF2AOkYKkHxZgwAAAABJRU5ErkJggg==',
  "progress4":      'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAWCAYAAACCAs+RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsIAAA7CARUoSoAAAABrSURBVFhH7ZbBDYBACATBVqxHi9V6rEXlwiVezgJ2yc4LwocJkOD3ixWgibh7ppzELJaM6SkjMq1WjImF3nf0/CuyHltmI9d+QtW+IroRNCSChkTQkAgaEkGjjEjdp5GRENGNoNFWK2NizB5kSkYKKMPFzAAAAABJRU5ErkJggg==',
  "progresserror0": 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAWCAYAAACCAs+RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAABsSURBVFhH7daxDcAgDERROyOkT8n+A6WkzwoJRk4RkQHurHsVdP4CJPwerIAZ4u655RRnseWaXpmQ5WrFMbF4546Zf0Ouo+UO197PT4jeCBqFoFEIGoWgUQiaMiF1P42MIkRvBM28WrkmZvYAO4w3Clt9ChsAAAAASUVORK5CYII=',
  "progresserror1": 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAWCAYAAACCAs+RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAB3SURBVFhH7ZaxDYBACEXBEewt3YLx2cLS3hVULlziRWvzIbyKn2t4AZLj84YS0ESY2WNMbBaT1+FJI/JaLRtTFHrf1vOnyLGsnkbmfSNV9TQiIr+/PUXqRtAoETRKBI0SQaNE0EgjkvfTGBETqRtBo62W14EhugDxSkYK6vuriAAAAABJRU5ErkJggg==',
  "progresserror2": 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAWCAYAAACCAs+RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAB4SURBVFhH7ZYxCoBQCIa1I7Q3dguP7y0a27tC5cOgR9EWqPzfpLj4oYK8n1ABmggze5oTm8XgcXrKiDxWy8aUhatv6/lVZJtmz3rGdfmsqapnPSLyS+0ughuJBkSiAZFoQCQaEIlGGZG6T2NGTAQ3Eo22Wh4nhugA1qpGCkK2tScAAAAASUVORK5CYII=',
  "progresserror3": 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAWCAYAAACCAs+RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAB1SURBVFhH7ZaxDYBACEXBEewt3YLx2cLS3hVULlgQrQ2Q/yp+ruEFSI7PG2rAEGFmjzWxWUxel6eNyGu1bExVePq2nj9FjmX1FJn37fc3VfUUEZEgghvJBkSyAZFsQCQbEMlGG5G+n8aKmAhuJBtjtbwuDNEFhspGCibKMf8AAAAASUVORK5CYII=',
  "progresserror4": 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAWCAYAAACCAs+RAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAABtSURBVFhH7ZYxDoBACATBJ9hb+v8HWdr7BZULl3g5H7BLdioIDRMgwe8XK0ATcfdMOYlZLBnTU0ZkWq0YEwu97+j5V+Ta9sxG1vOAqn1FdCNoSAQNiaAhETQkgkYZkbpPIyMhohtBo61WxsSYPWwqRgrWtBo1AAAAAElFTkSuQmCC',
};
// }}}

// {{{ function basename(url)
function basename(url) {
  let url_ = url.split("/");
  return url_[url_.length - 1];
};
// }}}
// {{{ function btoa2(data)
function btoa2(data) {
  return btoa(new Uint8Array(data).reduce(
    function(data, byte) {
      return data + String.fromCharCode(byte);
    }, ""));
};
// }}}
// {{{ function decodeHTML(input)
function decodeHTML(input) {
  var doc = new DOMParser().parseFromString(input, "text/html");
  return doc.documentElement.textContent;
};
// }}}
// {{{ function decodeURI2(uri)
function decodeURI2(uri) {
  return decodeURI(uri).replace(/\+/g, " ");
};
// }}}
// {{{ function deletePrototypeFunctions()
function deletePrototypeFunctions() {
  if(window.Prototype) {
    logDebug("Prototype.js detected, deleting possibly broken {Object,Array,Hash,String}.prototype.toJSON() functions");
    delete Object.prototype.toJSON;
    delete Array.prototype.toJSON;
    delete Hash.prototype.toJSON;
    delete String.prototype.toJSON;
  };
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
// {{{ function matchHostDict(dict, host)
function matchHostDict(dict, host) {
  let hostDomain = host.split(".").slice(-2).join(".");
  if (host in dict) {
    return dict[host];
  } else if (hostDomain in dict) {
    return dict[hostDomain];
  } else {
    return dict[""];
  };
};
// }}}

// {{{ function logDebug(msg)
function logDebug(msg) {
  if (debug) {
    console.log("[rtorrent] " + msg);
  };
};
// }}}
// {{{ function logError(msg)
function logError(msg) {
  logDebug(msg); alert("[rtorrent] " + msg);
};
// }}}
// {{{ function logInfo(msg)
function logInfo(msg) {
  logDebug(msg); alert("[rtorrent] " + msg);
};
// }}}
// {{{ function registerLink(cb, link, linkImage, linkNewId)
function registerLink(cb, link, linkImage, linkNewId) {
  let linkNew = document.createElement("a");

  linkNew.innerHTML = '<img src="' + linkImage + '" style="border: 0px" />';
  linkNew.setAttribute("href", link.href);
  linkNew.setAttribute("id", linkNewId);
  linkNew.style.paddingLeft = "2px";
  link.parentNode.insertBefore(linkNew, link.nextSibling);
  linkNew.addEventListener("click", cb, true);
};
// }}}
// {{{ function setLinkState(link, linkState, msg, error=false)
function setLinkState(link, linkState, msg, error=false) {
  if (error === false) {
    link.title = msg; link.src = images["progress" + linkState.toString()]; logDebug(msg);
  } else {
    link.title = msg; link.src = images["progresserror" + linkState.toString()]; logError(msg);
  };
};
// }}}

// {{{ function getXmlRpcResponseFault(xml)
function getXmlRpcResponseFault(xml) {
  let xpath = '/methodResponse/fault/value/struct/member';
  let query = xml.evaluate(xpath, xml, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
  let result = {"code": -1, "string": ""}

  for (let i = 0, l = query.snapshotLength; i < l; ++i) {
    let element = query.snapshotItem(i);
    switch (element.children[0].innerHTML.toString()) {
      case "faultCode":
        result.code = element.children[1].children[0].innerHTML; break;
      case "faultString":
        result.string = decodeHTML(element.children[1].children[0].innerHTML); break;
      default:
        throw "unknown/invalid element `" + element.children[0].innerHTML + "'";
    };
  };
  return result;
};
// }}}
// {{{ function parseXmlRpcResponse(e, xhr, onLoadCb)
function parseXmlRpcResponse(e, xhr, onLoadCb) {
  let error = null,
      parser = null,
      response = null;

  try {
    parser = new DOMParser();
    response = parser.parseFromString(xhr.responseText, "application/xml");
    if (response.documentElement.nodeName === "parsererror") {
      throw decodeHTML(response.documentElement.innerHTML);
    };
  }
  catch (error_) {
    error = "Error parsing response from server as XML: " + error_;
  };

  if (error === null) {
    switch (response.documentElement.nodeName.toString()) {
      case "methodResponse":
        switch (response.documentElement.children[0].nodeName.toString()) {
          case "fault":
            try {
              let fault = getXmlRpcResponseFault(response);
              error = "XML-RPC fault code " + fault.code + ": " + fault.string;
            }
            catch (error_) {
              error = "Error parsing XML-RPC fault response: " + error_;
            };
            break;

          case "params":
            break;

          default:
            error = "unknown/invalid document element child node `" + response.documentElement.children[0].nodeName + "'"; break;
        };
        break;

      default:
        error = "unknown/invalid document element `" + response.documentElement.nodeName + "'"; break;
    };
  };
  onLoadCb(error);
};
// }}}
// {{{ function postXmlRpcRequest(e, method, torrent, torrentDirectory, torrentType, onLoadCb)
function postXmlRpcRequest(e, method, torrent, torrentDirectory, torrentType, onLoadCb) {
  let headers = {"Content-type": "text/xml"};
  let xhrParams = {
    anonymous:    false,
    data:         `<?xml version="1.0" encoding="UTF-8"?>
<methodCall>
  <methodName>${method}</methodName>
  <params>
    <param><value><string></string></value></param>
    <param><value><${torrentType}>${torrent}</${torrentType}></value></param>
    <param><value><string>d.directory.set=${torrentDirectory}</string></value></param>
  </params>
</methodCall>`,
    headers:      headers,
    method:       "POST",
    onload:       function (xhr) { parseXmlRpcResponse(e, xhr, onLoadCb); },
    synchronous:  false,
    url:          rtorrentWebUrl
  };

  if ((rtorrentHttpAuth["password"] !== "")
  &&  (rtorrentHttpAuth["username"] !== "")) {
    xhrParams["password"] = rtorrentHttpAuth["password"];
    xhrParams["user"] = rtorrentHttpAuth["username"];
  };
  logDebug("POSTing asynchronous " + method + " XML-RPC API request to " + xhrParams["url"]);
  GM.xmlHttpRequest(xhrParams);
};
// }}}

// {{{ function cbClickLink(e, torrentUrl, cbUrlHost, cb)
function cbClickLink(e, torrentUrl, cbUrlHost, cb) {
  e.stopPropagation(); e.preventDefault();
  let torrentDownloadDir = "",
      torrentUrlHost = null;

  try { torrentUrlHost = cbUrlHost(torrentUrl); }
  catch {
    setLinkState(e.target, 0, "Failed to obtain hostname from BitTorrent URL `" + torrentUrl + "'", true); return;
  };

  if ((torrentDownloadDir = matchHostDict(rtorrentDownloadDir, torrentUrlHost)) === null) {
    torrentDownloadDir = rtorrentDownloadDir[""];
  };
  cb(e, torrentDownloadDir, torrentUrl, torrentUrlHost);
};
// }}}
// {{{ function cbClickLinkMagnet(e)
function cbClickLinkMagnet(e) {
  if (!e.ctrlKey) {
    let torrentUrl = this.href;

    cbClickLink(
      e, basename(torrentUrl),
      function (torrentUrl_) { return torrentUrl; },
      function (e, torrentDownloadDir, torrentUrl, torrentUrlHost) {
        let torrentName = null;
        try { torrentName = decodeURI2(torrentUrl.match(/dn=([^&]+)/)[1]); }
        catch {
          setLinkState(e.target, 0, "Invalid Magnet URI (missing Display Name)", true); return;
        };

        let xhr = {"readyState": 4, "status": 200};
        cbClickLinkResponse(e, e.target, torrentUrl, torrentDownloadDir,
                            torrentName, torrentUrl, torrentUrlHost, xhr);
      });
  };
};
// }}}
// {{{ function cbClickLinkTorrent(e)
function cbClickLinkTorrent(e) {
  if (!e.ctrlKey) {
    cbClickLink(
      e, this.href,
      function (torrentUrl) {
        return torrentUrl.match(new RegExp("^[^:]+://(?:[^:]+:[^@]+@)?([^/:]+)"))[1];
      },
      function (e, torrentDownloadDir, torrentUrl, torrentUrlHost) {
        let torrentName = basename(torrentUrl);

        setLinkState(e.target, 1, "Sending asynchronous GET request for " + torrentUrl + "...");
        GM.xmlHttpRequest({
          method:             "GET",
          onreadystatechange: function (xhr) {
                                cbClickLinkResponse(e, e.target, xhr.response, torrentDownloadDir,
                                                    torrentName, torrentUrl, torrentUrlHost, xhr);
                              },
          responseType:       "arraybuffer",
          synchronous:        false,
          url:                torrentUrl
        });
      });
  };
};
// }}}
// {{{ function cbClickLinkResponse(e, link, torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr)
function cbClickLinkResponse(e, link, torrent, torrentDownloadDir, torrentName, torrentUrl, torrentUrlHost, xhr) {
  logDebug("Asynchronous GET request for " + torrentUrl + " readyState=" + xhr.readyState + " status=" + xhr.status);
  if (xhr.readyState === 4) {
    if (xhr.status === 200) {
      let torrentRaw = null;
      if (isMagnetLink(torrentUrl)) {
        method = rtorrentMethods["magnet"][rtorrentStartOnAdd];
        torrentRaw = decodeURIComponent(torrentUrl).replace(/&/g, "&amp;");
        torrentType = "string";
      } else {
        method = rtorrentMethods["torrent"][rtorrentStartOnAdd];
        torrentRaw = btoa2(torrent);
        torrentType = "base64";
      };

      setLinkState(link, 3, "Received torrent data, sending " + method + " XML-RPC request...");
      postXmlRpcRequest(e, method, torrentRaw, torrentDownloadDir, torrentType,
                       function (error) { cbpostXmlRpcRequestResponse(e, error, e.target, torrentName); });
    } else {
      setLinkState(link, 2, "Asynchronous XML-RPC POST request for " + torrentUrl + " failed w/ status=" + xhr.status, false);
    };
  };
};
// }}}
// {{{ function cbpostXmlRpcRequestResponse(e, error, link, torrentName)
function cbpostXmlRpcRequestResponse(e, error, link, torrentName) {
  if (error === null) {
    logDebug("Asynchronous XML-RPC request succeeded");
    setLinkState(link, 4, "Successfully added torrent");
    logInfo("Torrent `" + torrentName + "' added successfully.");
  } else {
    logDebug("Asynchronous XML-RPC request failed: " + error);
    setLinkState(link, 0, error, true);
  };
};
// }}}

function main() {
  logDebug("Entry point");
  deletePrototypeFunctions();
  for (let link of document.links) {
    if (link.getAttribute("id") === "AddTorrentsRtorrentLink") {
      continue;
    } else if (isMagnetLink(link.href)) {
      registerLink(cbClickLinkMagnet, link, images["progress0"], "AddTorrentsRtorrentLink");
      logDebug("Registered Magnet link " + link.href);
    } else if (isTorrentLink(link.href)) {
      registerLink(cbClickLinkTorrent, link, images["progress0"], "AddTorrentsRtorrentLink");
      logDebug("Registered BitTorrent link " + link.href);
    };
  };
};

main();

// vim:expandtab fileformat=dos sw=2 ts=2
