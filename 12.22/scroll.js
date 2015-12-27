/**
 * Created by JerryHe on 12/22/15.
 */
window.onload = function(){
    var wrapper = document.getElementsByClassName('wrapper')[0];
    var lis = wrapper.children;
    console.log(lis);
    /*scrollRight*/
    function scrollRight(){

    }
    for(var i=0;i<lis.length;i++ ){
        lis[i].onclick = function(e){
            e = e || window.event;
            var el = e.target;
            switch (el.className){
                case 'menu0':
                console.log(el);
                    break;
                case 'scrollRight':
                    scrollRight();
                    console.log("heHui")
                    break;

            }
        }
    }
}