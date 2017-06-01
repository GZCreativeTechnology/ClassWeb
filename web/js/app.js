/**
 * Created by Administrator on 2016/10/11.
 */
window.onload = function() {
    imgLocation("container", "box");
    var imgData;
    $.get("/photo/random",
        function(data) {
            imgData = data;
        }, "json");
    window.onscroll = function() {
        if (checkFlag()) {
            var cparent = document.getElementById("container");
            for (var i = 0; i < imgData.data.length; i++) {
                var ccontent = document.createElement("div"); // 创建一个根视图，节点是一个div
                ccontent.className = "box"; // 设置css样式
                cparent.appendChild(ccontent); // 放到他的根视图，加载根视图
                var boxImg = document.createElement("div");
                boxImg.className = "box_img";
                ccontent.appendChild(boxImg);
				var aImg = document.createElement("a");
				aImg.href = "/photo/id?id=" + imgData.data[i].id;
				boxImg.appendChild(aImg);
                var img = document.createElement("img");
                img.src = "/" + imgData.data[i].src;
                aImg.appendChild(img);
            }
            imgLocation("container", "box");
        }
    }
}

function checkFlag() {
    var cparent = document.getElementById("container");
    var ccontent = getChildElement(cparent, "box");
    var lastContentHeight = ccontent[ccontent.length - 1].offsetTop; // 最后一张图片里顶部的高度
    var scrollTop = document.documentElement.scrollTop || document.body.scrollTop; // 滚动条离顶部的高度
    var pageHeight = document.documentElement.offsetHeight || document.documentElement.offsetHeight; // 页面的高度
    if (lastContentHeight < scrollTop+pageHeight) {
        return true;
    }
}

function imgLocation(parent, content) {
    var cparent = document.getElementById(parent);
    var ccontent = getChildElement(cparent, content);
    var imgWidth = ccontent[0].offsetWidth;
    var num = Math.floor(document.documentElement.clientWidth / imgWidth);
    cparent.style = "width: " + imgWidth*num + "px; margin:0 auto;";

    var boxHeightArr = [];
    for (var i = 0; i < ccontent.length; i++) {
        if (i < num) {
            boxHeightArr[i] = ccontent[i].offsetHeight;
        } else {
            var minHeight = Math.min.apply(null, boxHeightArr);
            var minIndex = getMinHeightLocation(boxHeightArr, minHeight);
            ccontent[i].style.position = "absolute";
            ccontent[i].style.top = minHeight + "px";
            ccontent[i].style.left = ccontent[minIndex].offsetLeft + "px";
            boxHeightArr[minIndex] += ccontent[i].offsetHeight;
        }

    }
}

function getMinHeightLocation(boxHeightArr, minHeight) {
    for (var i = 0; i < boxHeightArr.length; i++) {
        if (boxHeightArr[i] == minHeight) {
            return i;
        }
    }
}

function getChildElement(parent, content) {
    var contentAll = [];
    var allContent = parent.getElementsByTagName("*");

    for (var i = 0; i < allContent.length; i++) {
        if (allContent[i].className == content) {
            contentAll.push(allContent[i]);
        }
    }
    return contentAll;
}
