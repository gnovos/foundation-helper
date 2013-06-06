require 'spec_helper'

describe Foundation do

  it "can build a grid" do

    Foundation::Grid.new do
      row do |r|
        r << "<div>Inserted Row</div>"
        col(10) do |c|
          row do
            col(1) { "foo" }
            col(2) { "bar" }
            col(3) { "baz" }
          end
          c << "Inserted Column"
        end
      end

      row(:foo, 2, :bar) do
        col(:centered) { "centercol" }
      end

      row do
        col { "auto a" }
        col(:foo) { "auto b" }
        col { "auto c" }
      end

      row(6) do
        col { "auto a2" }
        col(:foo) { "auto b2" }
        col { "auto c2" }
      end

    end.to_s.should == <<-HTML
<div class='row'>
  <div>Inserted Row</div>
  <div class='small-10 large-10 columns'>
    <div class='row'>
      <div class='small-1 large-1 columns'>
        foo
      </div>
      <div class='small-2 large-2 columns'>
        bar
      </div>
      <div class='small-3 large-3 columns'>
        baz
      </div>
    </div>
    Inserted Column
  </div>
</div>
<div class='row foo bar'>
  <div class='small-2 large-2 columns centered'>
    centercol
  </div>
</div>
<div class='row'>
  <div class='small-4 large-4 columns'>
    auto a
  </div>
  <div class='small-4 large-4 columns foo'>
    auto b
  </div>
  <div class='small-4 large-4 columns'>
    auto c
  </div>
</div>
<div class='row'>
  <div class='small-2 large-2 columns'>
    auto a2
  </div>
  <div class='small-2 large-2 columns foo'>
    auto b2
  </div>
  <div class='small-2 large-2 columns'>
    auto c2
  </div>
</div>
    HTML
  end

end
