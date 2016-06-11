document.addEventListener("DOMNodeInserted", function(e) {
    walk(document.body);
}, false);

// credit: http://stackoverflow.com/questions/5904914/javascript-regex-to-replace-text-not-in-html-attributes/5904945#5904945
function walk(node) {
  var child, next;

  switch (node.nodeType) {
    case 1:  // Element
    case 9:  // Document
    case 11: // Document fragment
      child = node.firstChild;
      while (child) {
        next = child.nextSibling;
        walk(child);
        child = next;
      }
      break;
    case 3: // Text node
      shillify(node);
      break;
  }
}

function shillify(textNode) {
    var t = textNode.nodeValue

    t = t.replace(/\bHillary for America/g, "Shillary for corporate America")
        .replace(/\bhillary/g, "shillary")
        .replace(/\bHillary/g, "Shillary");

    textNode.nodeValue = t;
}
