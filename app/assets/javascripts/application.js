// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// = require turbolinks
//= require js-core/jquery-core
//= require js-core/jquery-ui-core
//= require js-core/jquery-ui-widget
//= require js-core/jquery-ui-mouse
//= require js-core/jquery-ui-position
//= require js-core/transition
//= require js-core/modernizr
//= require js-core/jquery-cookie
//= require bootstrap/js/bootstrap
//= require dataTables/jquery.dataTables
//= require widgets/dropdown/dropdown
//= require widgets/tooltip/tooltip
//= require widgets/popover/popover
//= require widgets/progressbar/progressbar
//= require widgets/button/button
//= require widgets/collapse/collapse
//= require widgets/superclick/superclick
//= require widgets/input-switch/inputswitch-alt
//= require widgets/slimscroll/slimscroll
//= require widgets/slidebars/slidebars
//= require widgets/slidebars/slidebars-demo
//= require widgets/charts/piegage/piegage
//= require widgets/charts/piegage/piegage-demo
//= require widgets/screenfull/screenfull
//= require widgets/content-box/contentbox
//= require widgets/overlay/overlay
//= require widgets/uniform/uniform
//= require widgets/wow/wow
//= require widgets/multi-select/multiselect
//= require moment
//= require bootstrap-datetimepicker
//= require data-confirm-modal
//= require select2.full.min
//= require_tree .

$(document).on('turbolinks:load', function(){
  /* Prevent default on # hrefs */

  $(function() { "use strict";
    $('a[href="#"]').click(function(event) {
        event.preventDefault();
    });
  });

  /* To do check toggle */

  $(function() { "use strict";
    $(".todo-box li input").on('click', function() {
        $(this).parent().toggleClass('todo-done');
    });
  });
    
  $(".js-example-basic-multiple").select2({
    placeholder: "Select a departments",
    theme: "classic"
  });

  /* Horizontal timeline */

  $(function() { "use strict";

    var overall_width = 0;

    $('.timeline-scroll .tl-row').each(function(index, elem) {
        var $elem = $(elem);
        overall_width += $elem.outerWidth() + parseInt($elem.css('margin-left'), 10) + parseInt($elem.css('margin-right'), 10);
    });

    $('.timeline-horizontal', this).width(overall_width);
  });

  /* Input switch alternate */

  $(function() { "use strict";
      $('.input-switch-alt').simpleCheckbox();
  });

  /* Slim scrollbar */

  $(function() { "use strict";
      $('.scrollable-slim').slimScroll({
          color: '#8da0aa',
          size: '10px',
          alwaysVisible: true
      });
  });

  $(function() { "use strict";
      $('.scrollable-slim-sidebar').slimScroll({
          color: '#8da0aa',
          size: '10px',
          height: '100%',
          alwaysVisible: true
      });
  });

  $(function() { "use strict";
      $('.scrollable-slim-box').slimScroll({
          color: '#8da0aa',
          size: '6px',
          alwaysVisible: false
      });
  });

  /* Loading buttons */

  $(function() { "use strict";

    $('.loading-button').click(function() {
        var btn = $(this)
        btn.button('loading');
    });

  });

  /* Tooltips */

  $(function() { "use strict";

    $('.tooltip-button').tooltip({
        container: 'body'
    });

  });

  /* Close response message */

  $(function() { "use strict";
    $('.alert-close-btn').click(function() {
        $(this).parent().addClass('animated fadeOutDown');
    });
  });

  /* Popovers */

  $(function() { "use strict";

    $('.popover-button').popover({
        container: 'body',
        html: true,
        animation: true,
        content: function() {
            var dataID = $(this).attr('data-id');
            return $(dataID).html();
        }
    }).click(function(evt) {
        evt.preventDefault();
    });

  });

  $(function() { "use strict";
    $('.popover-button-default').popover({
        container: 'body',
        html: true,
        animation: true
    }).click(function(evt) {
        evt.preventDefault();
    });
  });

  /* Color schemes */

  var mUIColors = {
      'default':      '#3498db',
      'gray':         '#d6dde2',
      'primary':      '#00bca4',
      'success':      '#2ecc71',
      'warning':      '#e67e22',
      'danger':       '#e74c3c',
      'info':         '#3498db'
  };

  var getUIColor = function (name) {
      if (mUIColors[name]) {
          return mUIColors[name];
      } else {
          return mUIColors['default'];
      }
  }

  /* Screenfull */

  if(document.getElementById('fullscreen-btn')) {
    document.getElementById('fullscreen-btn').addEventListener('click', function () {
      if (screenfull.enabled) {
          screenfull.request();
      }
    });
  }

  $(document).ready(function() {

      body_sizer();

      $("div[id='#fixed-sidebar']").on('click', function() {

          if ($(this).hasClass("switch-on")) {
              var windowHeight = $(window).height();
              var headerHeight = $('#page-header').height();
              var contentHeight = windowHeight - headerHeight;

              $('#page-sidebar').css('height', contentHeight);
              $('.scroll-sidebar').css('height', contentHeight);

              $('.scroll-sidebar').slimscroll({
                  height: '100%',
                  color: 'rgba(155, 164, 169, 0.68)',
                  size: '6px'
              });

              var headerBg = $('#page-header').attr('class');
              $('#header-logo').addClass(headerBg);

          } else {
              var windowHeight = $(document).height();
              var headerHeight = $('#page-header').height();
              var contentHeight = windowHeight - headerHeight;

              $('#page-sidebar').css('height', contentHeight);
              $('.scroll-sidebar').css('height', contentHeight);

              $(".scroll-sidebar").slimScroll({
                  destroy: true
              });

              $('#header-logo').removeClass('bg-gradient-9');

          }

      });

  });

  $(window).on('resize', function() {
      body_sizer();
  });

  function body_sizer() {

      if ($('body').hasClass('fixed-sidebar')) {

          var windowHeight = $(window).height();
          var headerHeight = $('#page-header').height();
          var contentHeight = windowHeight - headerHeight;

          $('#page-sidebar').css('height', contentHeight);
          $('.scroll-sidebar').css('height', contentHeight);
          $('#page-content').css('min-height', contentHeight);

      } else {

          var windowHeight = $(document).height();
          var headerHeight = $('#page-header').height();
          var contentHeight = windowHeight - headerHeight;

          $('#page-sidebar').css('height', contentHeight);
          $('.scroll-sidebar').css('height', contentHeight);
          $('#page-content').css('min-height', contentHeight);

      }

  };

  function pageTransitions() {

      var transitions = ['.pt-page-moveFromLeft', 'pt-page-moveFromRight', 'pt-page-moveFromTop', 'pt-page-moveFromBottom', 'pt-page-fade', 'pt-page-moveFromLeftFade', 'pt-page-moveFromRightFade', 'pt-page-moveFromTopFade', 'pt-page-moveFromBottomFade', 'pt-page-scaleUp', 'pt-page-scaleUpCenter', 'pt-page-flipInLeft', 'pt-page-flipInRight', 'pt-page-flipInBottom', 'pt-page-flipInTop', 'pt-page-rotatePullRight', 'pt-page-rotatePullLeft', 'pt-page-rotatePullTop', 'pt-page-rotatePullBottom', 'pt-page-rotateUnfoldLeft', 'pt-page-rotateUnfoldRight', 'pt-page-rotateUnfoldTop', 'pt-page-rotateUnfoldBottom'];
      for (var i in transitions) {
          var transition_name = transitions[i];
          if ($('.add-transition').hasClass(transition_name)) {

              $('.add-transition').addClass(transition_name + '-init page-transition');

              setTimeout(function() {
                  $('.add-transition').removeClass(transition_name + ' ' + transition_name + '-init page-transition');
              }, 1200);
              return;
          }
      }

  };

  $(document).ready(function() {

      pageTransitions();

      // ADD SLIDEDOWN ANIMATION TO DROPDOWN //
      $('.dropdown').on('show.bs.dropdown', function(e){
          $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
      });

      // ADD SLIDEUP ANIMATION TO DROPDOWN //
      $('.dropdown').on('hide.bs.dropdown', function(e){
          $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
      });

      /* Sidebar menu */
      $(function() {

          $('#sidebar-menu').superclick({
              animation: {
                  height: 'show'
              },
              animationOut: {
                  height: 'hide'
              }
          });

          //automatically open the current path
          var path = window.location.pathname.split('/');
          path = path[path.length-1];
          if (path !== undefined) {
              $("#sidebar-menu").find("a[href$='" + path + "']").addClass('sfActive');
              $("#sidebar-menu").find("a[href$='" + path + "']").parents().eq(3).superclick('show');
          }

      });

      /* Colapse sidebar */
      $(function() {

          $('#close-sidebar').click(function() {
              $('body').toggleClass('closed-sidebar');
              $('.glyph-icon', this).toggleClass('icon-angle-right').toggleClass('icon-angle-left');
          });

      });

      /* Sidebar scroll */



  });

  /* Admin layout options */

  $(document).on('ready', function() {

      $('#theme-switcher-wrapper .switch-toggle').on('click', this, function() {
          var dataToggle = $(this).prev().attr('data-toggletarget');
          $('body').toggleClass(dataToggle);

          if ( dataToggle = 'closed-sidebar' ) {
              $('#close-sidebar .glyph-icon').toggleClass('icon-angle-right').toggleClass('icon-angle-left');
          }
      });

      $('.switch-toggle[id="#boxed-layout"]').click(function(){

          if ( $('#boxed-layout').attr("checked") ) {
              $('.boxed-bg-wrapper').slideDown();
          } else {
              $('.boxed-bg-wrapper').slideUp();
          }

      });
  });

  /* Open theme switcher */

  $(function() {

      $(".theme-switcher").click(function() {
          $("#theme-options").toggleClass('active');
      });

  });

  /* Admin header style */

  $(function() {

      $('.set-adminheader-style').click(function() {
          $('.set-adminheader-style').removeClass('active');
          $(this).addClass('active');
          var newBg = $(this).attr('data-header-bg');
          $("#page-header").removeClass(function(index, css) {
              return (css.match(/(^|\s)bg-\S+/g) || []).join(' ');
          });
          $("#page-header").removeClass(function(index, css) {
              return (css.match(/(^|\s)font-\S+/g) || []).join(' ');
          });
          $('#page-header').addClass(newBg);
      });

  });

  /* Admin sidebar style */

  $(function() {

      $('.set-sidebar-style').click(function() {
          $('.set-sidebar-style').removeClass('active');
          $(this).addClass('active');
          var newBg = $(this).attr('data-header-bg');
          $("#page-sidebar").removeClass(function(index, css) {
              return (css.match(/(^|\s)bg-\S+/g) || []).join(' ');
          });
          $("#page-sidebar").removeClass(function(index, css) {
              return (css.match(/(^|\s)font-\S+/g) || []).join(' ');
          });
          $('#page-sidebar').addClass(newBg);
      });

  });

  /* Boxed layout background style */

  $(function() {

      $('.set-background-style').click(function() {
          $('.set-background-style').removeClass('active');
          $(this).addClass('active');
          var newBg = $(this).attr('data-header-bg');
          $("body").removeClass(function(index, css) {
              return (css.match(/(^|\s)pattern-\S+/g) || []).join(' ');
          });
          $("body").removeClass(function(index, css) {
              return (css.match(/(^|\s)full-\S+/g) || []).join(' ');
          });
          $("body").removeClass(function(index, css) {
              return (css.match(/(^|\s)bg-\S+/g) || []).join(' ');
          });
          $("body").removeClass(function(index, css) {
              return (css.match(/(^|\s)fixed-\S+/g) || []).join(' ');
          });
          $('body').addClass(newBg);
      });

  });

  /* Frontend header style */

  $(function() {

      $('.set-header-style').click(function() {
          $('.set-header-style').removeClass('active');
          $(this).addClass('active');
          var newBg = $(this).attr('data-header-bg');
          $(".main-header").removeClass(function(index, css) {
              return (css.match(/(^|\s)bg-\S+/g) || []).join(' ');
          });
          $(".main-header").removeClass(function(index, css) {
              return (css.match(/(^|\s)font-\S+/g) || []).join(' ');
          });
          $('.main-header').addClass(newBg);
      });

  });

  /* Frontend footer style */

  $(function() {

      $('.set-footer-style').click(function() {
          $('.set-footer-style').removeClass('active');
          $(this).addClass('active');
          var newBg = $(this).attr('data-header-bg');
          $(".main-footer").removeClass(function(index, css) {
              return (css.match(/(^|\s)bg-\S+/g) || []).join(' ');
          });
          $(".main-footer").removeClass(function(index, css) {
              return (css.match(/(^|\s)font-\S+/g) || []).join(' ');
          });
          $('.main-footer').addClass(newBg);
      });

  });


  /* Frontend top menu style */

  $(function() {

      $('.set-topmenu-style').click(function() {
          $('.set-topmenu-style').removeClass('active');
          $(this).addClass('active');
          var newBg = $(this).attr('data-header-bg');
          $(".top-bar").removeClass(function(index, css) {
              return (css.match(/(^|\s)bg-\S+/g) || []).join(' ');
          });
          $(".top-bar").removeClass(function(index, css) {
              return (css.match(/(^|\s)font-\S+/g) || []).join(' ');
          });
          $('.top-bar').addClass(newBg);
      });

  });

  /* Theme styler scroll */

  $(function() {

      $('.scroll-switcher').slimscroll({
          height: '100%',
          color: 'rgba(0,0,0,0.3)',
          size: '10px',
          alwaysVisible: true
      });
      //
      //$(".scroll-switcher").slimScroll({
      //    destroy: true
      //});

  });

  /* Sidebar menu */
  $(function() {

        var menu = $('#sidebar-menu').superclick({
            animation: {
                height: 'show'
            },
            animationOut: {
                height: 'hide'
            }
        });
      
        //automatically open the current path
        var path = window.location.pathname.split('/');
        path = path[path.length-1];
        if (path !== undefined) {
            $("#sidebar-menu").find("a[href$='" + path + "']").addClass('sfActive');
            $("#sidebar-menu").find("a[href$='" + path + "']").parents().eq(3).superclick('show');
        }

  });

  function swither_resizer() {
      var windowHeight = $(window).height();
      $('#theme-switcher-wrapper').height(windowHeight / 1.4);
  }

  $(document).on('ready', function() {
      swither_resizer();
  });

  $(window).on('resize', function() {
      swither_resizer();
  });
});