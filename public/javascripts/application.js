(function ($) {
  $.widget("ui.timeselect", {
    options: {
      source: null
    },
    _create: function () {
      var self = this;

      //var list_container = this.list_container = $("<div></div>")
        //.addClass("ui-timeselect-list-container")
        //.addClass("ui-widget ui-widget-content ui-corner-all")
        //.hide()
        //.insertAfter(this.element);
      
      var list = this.list = $("<ul></ul>")
        .addClass("ui-timeselect-list")
        .menu({
          selected: function(c, f) {
            self.element.val(f.item.text());
          }
        }).hide().data("menu");

      //list_container.append(list.element);

      this.list.element.insertAfter(this.element);

      this.element.attr("autocomplete", "off");
      this.element.click(
        function() {
          self.showList();
        }
      )
      .blur(
        function() {
          setTimeout(function() {
            if(!this.list.active)
              self.hideList();
          }, 150);
        }
      );

      this._initSource();

      this.element.bind("keydown", function(c) {
        g = false;
        var f = $.ui.keyCode;
        switch (c.keyCode) {
          case f.PAGE_UP:
            break;
          case f.PAGE_DOWN:
            break;
          case f.UP:
            self._move("previous", c);
            c.preventDefault();
            break;
          case f.DOWN:
            self._move("next", c);
            c.preventDefault();
            break;
          case f.ENTER:
          case f.NUMPAD_ENTER:
            if( self.menu.active ) {
              g = true;
              c.preventjDefault();
            }
          case f.TAB:
            if (!self.menu.active) return;
            self.menu.select(c);
            break;
          case f.ESCAPE:
            break;
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
          $(self.list.element)
            .append(
              $('<li></li>')
                .append(
                  $('<a></a>').html(value)
                )
            );
        });
        self.list.refresh();
      }
    },
    showList: function() {
      //this.list_container.show();
      this.list.element.show();
    },
    hideList: function() {
      //if(this.list_container.is(":visible"))
        //this.list_container.hide();
      if(this.list.element.is(":visible"))
        this.list.element.hide();
    },
    _move: function(a, b) {
      if (this.list.element.is(":visible"))
        if (this.list.first() && /^previous/.test(a) || this.list.last() && /^next/.test(a)) {
          this.element.val(this.term);
          this.list.deactivate()
        } else {
          this.list[a](b);
        }
      else
        this.search(null, b)
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

