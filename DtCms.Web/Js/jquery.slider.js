
$.fn.slider = function (options) {
    var opt = $.extend($.fn.slider.defaults, options);
    return this.each(function () {
        var base = new $.fn.slider.base();
        var wrapper = $(opt.wrapper);
        var tot = 0;
        wrapper.on("mouseenter mouseleave", function (e) {
            if (e.type == "mouseleave") {
                tot = setTimeout(function () {
                    base.autoPlayFlag = true;
                }, opt.ticker);
            }
            else {
                if (tot) {
                    clearTimeout(tot);
                }
                base.autoPlayFlag = false;
            }
        });
        var $this = $(this);
        var aLeft = $(opt.arrowLeft);
        var aRight = $(opt.arrowRight);
        aLeft.on("click", function () {
            base.showPrev();
        });
        aRight.on("click", function () {
            base.showNext();
        });
        wrapper.append(aLeft);
        wrapper.append(aRight);

        var imgs = $(opt.imgs);
        var nav = $(opt.nav);
        var cur = 0;
        var max = 1000;
        $this.find("a").each(function () {
            var dot = $(opt.dot);
            $(this).find("img").attr("tag", cur).css("z-index", max--);
            dot.attr("tag", cur++);
            dot.on("mouseenter", function () {
                var tag = parseInt($(this).attr("tag"));
                base.show(tag);
            });
            nav.append(dot);
            imgs.append(this);
        });
        base.count = cur;
        if (opt.effect == "fadein") {
            imgs.attr("class", "bn-img-fade");
        }
        wrapper.append(nav);
        wrapper.append(imgs);
        base.ctrl = wrapper;
        base.opt = opt;
        base.colorDot();
        setInterval(function () {
            base.autoPlay();
        }, opt.ticker);
        $this.replaceWith(wrapper);
    });
};

$.fn.slider.defaults = {
    showDots: true,
    ticker: 3200,
    aTicker: 800,
    effect: "slider", //slider,fadein
    wrapper: '<div class="bn-all"></div>',
    arrowLeft: '<div class="left anim">&lt;</div>',
    arrowRight: '<div class="right anim">&gt;</div>',
    nav: '<div class="nav"></div>',
    dot: '<em></em>',
    imgs: '<div class="bn-img"></div>'
};

$.fn.slider.base = function () {
    return {
        opt: {},
        ctrl: {},
        cur: 0,
        count: 0,
        showNav: false,
        first: null,
        autoPlayFlag: true,
        offset: 0,
        dir: true,
        max: 1000,
        autoPlay: function () {
            if (this.autoPlayFlag) {
                if (this.dir) {
                    this.showNext(true);
                }
                else {
                    this.showPrev(true);
                }
            }
        },
        showSlider: function (tag) {
            if (!this.first) {
                this.first = this.ctrl.find(".bn-img").find("img").eq(0);
                this.offset = 0 - this.first.width();
                this.ctrl.find(".bn-img").css("width", this.offset * this.count);
            }
            var calLeft = this.offset * this.cur;
            this.ctrl.find(".bn-img").stop().animate({
                marginLeft: calLeft
            }, this.opt.aTicker);
        },
        getFadeinEl: function (tag) {
            return this.ctrl.find(".bn-img-fade img[tag=" + tag + "]");
        },
        bring: function (tag, idx) {
            this.getFadeinEl(tag).css({ zIndex: idx, opacity: 0 });
        },
        showFadein: function (tag) {
            this.bring(tag, this.max++);
            $(this.getFadeinEl(tag)).stop().animate({
                opacity: 1
            }, this.opt.aTicker);
        },
        show: function (tag) {
            this.cur = tag;
            if (this.opt.showDots) {
                this.colorDot();
            }
            if (this.opt.effect == "fadein") {
                this.showFadein(tag);
            }
            else {
                this.showSlider(tag);
            }
        },
        colorDot: function () {
            this.ctrl.find(".ehover").removeClass("ehover");
            this.ctrl.find("em[tag=" + this.cur + "]").addClass("ehover");
        },
        showNext: function (flag) {
            this.cur++;
            if (this.cur > this.count - 1) {
                if (flag) {
                    this.cur = this.count - 2;
                    this.dir = false;
                }
                else {
                    this.cur = 0;
                }
            }
            this.show(this.cur);
        },
        showPrev: function (flag) {
            this.cur--;
            if (this.cur < 0) {
                if (flag) {
                    this.cur = 1;
                    this.dir = true;
                }
                else {
                    this.cur = this.count - 1;
                }
            }
            this.show(this.cur);
        }
    }
};