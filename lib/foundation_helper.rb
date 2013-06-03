require 'mobj'

module Foundation

  class Row

    def initialize(max=12, &block)
      @max, @cols = max, []
      instance_exec(self, &block) if block
    end

    def col(*args, &block)
      @cols << Column.new(*args, &block)
    end

    def render(depth=0)
      unsized = @cols.select { |c| c.width.nil? }.count
      remaining = @max - @cols.map(&:width).msum
      width = [(remaining / unsized), 1].max unless unsized.z0?

      out = "  " * depth
      out += "<div class='row'>\n"
      @cols.each do |column|
        out += column.render(depth + 1, width)
      end
      out += ("  " * depth)
      out += "</div>\n"
      out
    end

  end

  class Column

    WIDTHS = { 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve' }

    attr_reader :width
    def initialize(*args, &block)
      @content, @classes, @width = [], args.select { |arg| !arg.is_a? Fixnum }, args.find{ |arg| arg.is_a? Fixnum }
      if block
        content = instance_exec(self, &block)
        @content << content if content
      end
    end

    def row(max=12, &block)
      @content << Row.new(max, &block)
      nil
    end

    def render(depth=0, w=nil)
      out = ("  " * depth)
      out += "<div class='#{[WIDTHS[(width || w || 12).i!], 'columns', *@classes].join(' ')}'>\n"
      @content.each do |content|
        if content.is_a?(Foundation::Row)
          out += content.render(depth + 1)
        else
          out += ("  " * (depth + 1))
          out += content.to_s
          out += "\n"
        end
      end
      out += ("  " * depth)
      out += "</div>\n"
      out
    end
  end

  class Grid

    def initialize(&block)
      @rows = []
      instance_exec(&block) if block
    end

    def row(max=12, &block)
      @rows << Row.new(max, &block)
    end

    def to_s
      g = ""
      @rows.each do |r|
        g += r.render
      end

      g
    end
    alias_method :to_str, :to_s

  end

end

