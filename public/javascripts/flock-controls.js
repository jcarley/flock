(function ($) {
  $.widget("ui.timeselect", {
    options: {
      source: null
    },
    _create: function () {
      var self = this,
        b = this.element[0].ownerDocument,
        g;

      this.element.attr("autocomplete", "off").attr({
        role: "textbox",
        "aria-haspopup": "true"
      }).bind("keydown.timeselect", function(c) {
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
              c.preventDefault();
            }
          case f.TAB:
            if (!self.menu.active) return;
            self.menu.select(c);
            break;
          case f.ESCAPE:
            break;
        }
      }).bind("keypress.timeselect", function(c) {
        if (g) {
          g = false;
          c.preventDefault();
        }
      }).bind("focus.timeselect", function(c) {
        self.selectedItem = null;
        self.previous = self.element.val();
      }).bind("blur.timeselect", function(c) {
        self.closing = setTimeout(function() {
          self.close(c);
          self._change(c);
        }, 150);
      }).bind("click.timeselect", function(c) {
        self.menu.element.show();
      });

      this.menu = $("<ul></ul>")
        .addClass("ui-timeselect-list")
        .mousedown(function (c) {
          var f = self.menu.element[0];
          $(c.target).closest(".ui-menu-item").length || setTimeout(function() {
            $(document).one("mousedown", function (h) {
              h.target !== a.element[0] && h.target !== f && !$.ui.contains(f, h.target) && self.close();
            })
          }, 1);
          setTimeout(function() {
            clearTimeout(self.closing);
          }, 13);
        }).menu({
          focus: function (c, f) {
            f = f.item.data("item.timeselect");
            false !== self._trigger("focus", c, {
              item: f
            }) && /^key/.test(c.originalEvent.type) && self.element.val(f.value)
          },
          selected: function(c, f) {
            var h = f.item.data("item.timeselect"),
              i = self.previous;

            if (self.element[0] !== b.activeElement) {
              self.element.focus();
              self.previous = i;
              setTimeout(function () {
                self.previous = i;
                self.selectedItem = h;
              }, 1);
            }
            false !== self._trigger("select", c, {
              item: h
            }) && self.element.val(h);
            self.term = self.element.val();
            self.close(c);
            self.selectedItem = h
          },
          blur: function () {
            self.menu.element.is(":visible") && self.element.val() !== self.term && self.element.val(self.term)
          }
        }).hide().data("menu");

      this._initSource();

      this.menu.element.insertAfter(this.element);
    },
    destroy: function() {
      console.log("timeselect.destroy");
    },
    _initSource: function() {
      var b;
      var self = this;
      if($.isArray(this.options.source)) {
        b = this.options.source;
        $.each(b, function(index, value) {
          $(self.menu.element)
            .append(
              $('<li></li>')
                .data("item.timeselect", value)
                .append(
                  $('<a></a>').text(value)
                )
            );
        });
        self.menu.refresh();
      }
    },
    close: function (a) {
      clearTimeout(this.closing);
      if(this.menu.element.is(":visible")) {
        this.menu.element.hide();
        this.menu.deactivate();
        this._trigger("close", a);
      }
    },
    _change: function (a) {
      this.previous !== this.element.val() && this._trigger("change", a, {
        item: this.selectedItem
      })
    },
    _move: function (a, b) {
      if (this.menu.element.is(":visible"))
        if (this.menu.first() && /^previous/.test(a) || this.menu.last() && /^next/.test(a)) {
          this.element.val(this.term);
          this.menu.deactivate()
        } else {
          this.menu[a](b);
        }
    },
    widget: function () {
      return this.menu.element
    }
  });
})(jQuery);
