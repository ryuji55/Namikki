$(function() {
    // 対象の画像
    let bgImg = $('.description_img img');
    // 画像の縦横サイズ
    let bgWidth = 1200;
    let bgHeight = 900;
 
    // 画像のサイズ調整
    function adjust() {
        // 画面サイズの取得
        let winWidth = $(window).width();
        let winHeight = $(window).height();
 
        // 画像幅を仮で画面幅にする
        let imgWidth = winWidth;
        // 画面幅と画像比率に合わせた画像高さを取得
        let imgHeight = Math.floor(bgHeight * (winWidth / bgWidth));
        // 画面高さと画像高さから、画像が上下中央にくるtopの位置を取得
        let imgTop = (winHeight - imgHeight) / 2;
        // 画面幅 = 画像幅なので、leftは0
        let imgLeft = 0;
 
        // 画像高さが画面高さより大きい時
        if(imgHeight >= winHeight) {
        // 画像高さが画面高さ未満の時
        } else {
            // 画像高さを画面高さにする
            imgHeight = winHeight;
            // 画面高さと画像比率に合わせた画像幅を取得
            imgWidth = Math.floor(bgWidth * (winHeight / bgHeight));
            // 画面高さ = 画像高さなので、topは0
            imgTop = 0;
            // 画面幅と画像幅から、画像が左右中央にくるleftの位置を取得
            imgLeft = (winWidth - imgWidth) / 2;
        }
 
        // 画像のサイズと位置の指定
        bgImg.css({
            top: imgTop,
            left: imgLeft,
            width: imgWidth,
            height: imgHeight
        })
    }
    adjust();
 
    // ページ読み込み時、リサイズ時に画像調整を実行
    $(window).on('load resize', function() {
        adjust();
    });
});
