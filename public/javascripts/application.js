(function ($) {
  $.widget("ui.timeselect", {
    options: {
      source: null
    },
    _create: function () {
      var self = this;
      var list = this.list = $("<ul></ul>")
        .addClass("ui-timeselect-list");

      var list_container = this.list_container = $("<div></div>")
        .addClass("ui-timeselect-list-container")
        .addClass("ui-widget ui-widget-content ui-corner-all")
        .hide()
        .append(list)
        .insertAfter(this.element);

      this.element.attr("autocomplete", "off");
      this.element.click(
        function() {
          self.showList();
        }
      )
      .blur(
        function() {
          setTimeout(function() { self.hideList(); }, 150);
        }
      );

      this._initSource();
      this.list.menu({
        selected: function(c, f) {
          //f.preventDefault();
          self.element.val(f.item.text());
        }
      });

    },
    destroy: function() {
    },
    _initSource: function() {
      var b;
      var self = this;

      if($.isArray(this.options.source)) {
        b = this.options.source;
        $.each(b, function(index, value) {
          $(self.list)
            .append(
              $('<li></li>')
                //.addClass("ui-timeselect-list-item")
                //.addClass("ui-corner-all")
                //.hover(function() {
                  //$(this).toggleClass("ui-state-hover");
                //},
                //function() {
                  //$(this).toggleClass("ui-state-hover");
                //})
              .append(
                $('<a></a>')
                  //.click(function(a) {
                    //a.preventDefault();
                    //self.element.val($(this).text());
                    //self.hideList();
                  //})
                .html(value)
              )
            );
        });
      }
    },
    showList: function() {
      this.list_container.show();
    },
    hideList: function() {
      if(this.list_container.is(":visible"))
        this.list_container.hide();
    }
  });
})(jQuery);


(function ($) {
  $.widget("ui.combobox", {
    _create: function () {
      var self = this,
        select = this.element.hide(),
        selected = select.children(":selected"),
        value = selected.val() ? selected.text() : "";
      var input = this.input = $("<input>").insertAfter(select).val(value).autocomplete({
        delay: 0,
        minLength: 0,
        source: function (request, response) {
        },
        select: function (event, ui) {
        },
        change: function (event, ui) {
        }
      }).addClass("ui-widget ui-widget-content ui-corner-left");

      input.data("autocomplete")._renderItem = function (ul, item) {
        return $("<li></li>").data("item.autocomplete", item).append("<a>" + item.label + "</a>").appendTo(ul);
      };

      this.button = $("<button type='button'>&nbsp;</button>").attr("tabIndex", -1).attr("title", "Show All Items").insertAfter(input).button({
        icons: {
          primary: "ui-icon-triangle-1-s"
        },
        text: false
      }).removeClass("ui-corner-all").addClass("ui-corner-right ui-button-icon").click(function () {
        // close if already visible
        if (input.autocomplete("widget").is(":visible")) {
          input.autocomplete("close");
          return;
        }

        // work around a bug (likely same cause as #5265)
        $(this).blur();

        // pass empty string as value to search for, displaying all results
        input.autocomplete("search", "");
        input.focus();
      });
    },

    destroy: function () {
      this.input.remove();
      this.button.remove();
      this.element.show();
      $.Widget.prototype.destroy.call(this);
    }
  });
})(jQuery);

