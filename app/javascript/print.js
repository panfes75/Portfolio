$(function(){
  // 印刷ボタンクリック
  $('.print-button').on('click', function(){
    // 印刷エリア"print-area"の取得
    var printArea = document.getElementsByClassName("print-area");
    // 印刷用の要素"#print"を作成、取得した印刷エリア"print-area"を要素にいれる
    $('body').append('<div id="print" class="printBc"></div>');
    $(printArea).clone().appendTo("#print");
    // 印刷しないエリア"print-off"を追加
    $("body > :not(#print)").addClass("print-off");
    // 印刷ダイアログ呼び出し
    window.print();
    //window.print()を実行した後、作成した「#print」と、非表示用のclass「print-off」を削除
    $("#print").remove();
    $(".print-off").removeClass("print-off");
  });
});
