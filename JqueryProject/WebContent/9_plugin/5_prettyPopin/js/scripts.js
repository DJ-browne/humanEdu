/**
 * 
 */
$(function(){
   $('a[rel="prettyPopin"]:first').prettyPopin({
      width : 500
   });
   
   $('a[rel="prettyPopin"]:last').prettyPopin({
      width : 500,
      callback : function(){
         alert('팝업창이 닫힘');         // 내부에 함수를 작성할 수도 있음
      }
   });
})