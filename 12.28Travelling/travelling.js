/**
 * Created by JerryHe on 12/28/15.
 */
    /*focus picture*/
    var FocusPicture = function(pics,lis,timer){
        /*实现自动切换*/
        var imgs=[];
        for(var i=0;i<pics.length;i++){
            var tmp = pics[i].children[0].children[0].src;
            imgs.push(tmp);
        }
        setInterval(ShowPics(imgs),timer);
        function ShowPics(){

        }
        /*nav焦点颜色切换*/
        function ToggleDot(el){
            var des = el.parentNode.parentNode;
            var des = des.getElementsByTagName('span');
            for(var j = 0 ;j< lis.length; j++){
                des[j].style.background = "#eee";
                des[j].id = j;
            }

            el.style.background = "green";
        }
        /*焦点图片切换*/
        function TogglePicture(el){

            var  index = el.getAttribute("id");
            for(var m = 0 ; m<pics.length;m++){
                pics[m].style.display = "none";

            }
            pics[index].style.display= 'block';
        }
        /*event proxy*/
        for(var i = 0;i<lis.length;i++){
            lis[i].onclick = function(e){
                e = e || window.event;
                var el = e.srcElement||e.target;
                switch (el.className){
                    case 'dotFigure':
                        ToggleDot(el);
                        TogglePicture(el);
                        break;
                }
            }
        }
    };

        //控制目的地选择的显示和隐藏
        var el = document.getElementById("toggleDes");
        var des = document.getElementById("city-location");


        var flag = function(){
            if(des.style.display == "inline-block"){
                return true;
            }
            else{
                return false;
            }
        };

        el.onclick = function(){

            if(flag()){
                des.style.display = "none";
            }
            else{
                des.style.display = "inline-block";
            }
        };
