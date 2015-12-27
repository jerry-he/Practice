/**
 * Created by JerryHe on 12/26/15.
 */
window.onload = function(){
    //插入qq表情包
    var a = '<li class="qqFace" style = "line-height:0"><a><img class="faceSelected" src="https://im.gagahi.com//Content/blue/emotions/images/{0}.gif" </a></li>';
    var ul = document.createElement("ul");
    ul.className = 'qqWrapper';
    for(var i= 0;i <= 89;i++){
        ul.innerHTML += a.format(i);
    }
    document.getElementsByClassName('qqWrapper')[0].appendChild(ul);

    //插入3dpig表情包
    var a = '<li class="beaverFace" style = "line-height:0"><a><img class="faceSelected" src="../content/imgs/face/3dpig/{0}.gif" </a></li>';
    var ul = document.createElement("ul");
    ul.className = 'beaverWrapper';
    for(var i= 0;i <= 33;i++){
        ul.innerHTML += a.format(i);
    }
    document.getElementsByClassName('beaverWrapper')[0].appendChild(ul);
    //插入sister
    var a = '<li class="sisterFace" style = "line-height:0"><a><img class="faceSelected" src="../content/imgs/face/sister/{0}.gif" </a></li>';
    var ul = document.createElement("ul");
    ul.className = 'sisterWrapper';
    for(var i= 0;i <= 49;i++){
        ul.innerHTML += a.format(i);
    }
    document.getElementsByClassName('sisterWrapper')[0].appendChild(ul);


    //根据tab index控制表情包显示
    var contents = document.getElementsByClassName('content')[0];
    contents = contents.children;
    var boxes = document.getElementsByClassName('tabIndex')[0];
        box = boxes.children;//为表情框的所有元素增加点击事件
    for(var i = 0;i<box.length;i++){
        box[i].onclick = function(e){   //e传入点击事件e
            var e = e || window.event;
            var el = e.srcElement || e.target;
            var tabs = document.getElementsByClassName('tabWrapper')[0];
                tabs = tabs.children;
            for(var j = 0;j<tabs.length;j++){
                tabs[j].className = "faceIndex";
                tabs[j].id = j;
                var des = el.parentNode.parentNode;
                des.className = 'FaceIndex active';
                var index = tabs[j].getAttribute('id');
                contents[index].style.display = 'none';
            }
            var c = des.id || 0; //如果出现c为null时则显示默认标签
            contents[c].style.display = 'block';

        };


        //console.log(contents[i]);}
    }

};

String.prototype.format = function (args) {
    var result = this;
    if (arguments.length > 0) {
        if (arguments.length == 1 && typeof (args) == "object") {
            for (var key in args) {
                if (args[key] != undefined) {
                    var reg = new RegExp("({" + key + "})", "g");
                    result = result.replace(reg, args[key]);
                }
            }
        }
        else {
            for (var i = 0; i < arguments.length; i++) {
                if (arguments[i] != undefined) {
                    var reg = new RegExp("({)" + i + "(})", "g");
                    result = result.replace(reg, arguments[i]);
                }
            }
        }
    }
    return result;
}