//编码 
function URLencode(sStr) {
    return escape(sStr);
}

//返回元素
function g(eid) {
    return document.getElementById(eid);
}


//去左空格; 
function ltrim(s) {

    return s.replace(/(^\s*)/g, "");
}
//去右空格; 
function rtrim(s) {
    return s.replace(/(\s*$)/g, "");
}
//去左右空格; 
function trim(s) {
    //s.replace(/(^\s*)|(\s*$)/g, "");
    return rtrim(ltrim(s));
}  

//==========================================================================
// 代码描述：打开一个新的没有状态栏、工具栏、菜单栏、定位栏，
//            不能改变大小，且位置居中的新窗口
// 
// 传入参数：pageURL - 传递链接
//            innerWidth - 传递需要打开新窗口的宽度
//            innerHeight - 传递需要打开新窗口的高度
// 
// 返回参数：无
//
//
//==========================================================================
function g_OpenWindow(pageURL, innerWidth, innerHeight)
{    
    var ScreenWidth = screen.availWidth
    var ScreenHeight = screen.availHeight
    var StartX = (ScreenWidth - innerWidth) / 2
    var StartY = (ScreenHeight - innerHeight) / 2
    window.open(pageURL, '', 'left='+ StartX + ', top='+ StartY + ', Width=' + innerWidth +', height=' + innerHeight + ', resizable=no, scrollbars=no, status=no, toolbar=no, menubar=no, location=no')
}