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

      row do
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
  <div class='ten columns'>
    <div class='row'>
      <div class='one columns'>
        foo
      </div>
      <div class='two columns'>
        bar
      </div>
      <div class='three columns'>
        baz
      </div>
    </div>
    Inserted Column
  </div>
</div>
<div class='row'>
  <div class='twelve columns centered'>
    centercol
  </div>
</div>
<div class='row'>
  <div class='four columns'>
    auto a
  </div>
  <div class='four columns foo'>
    auto b
  </div>
  <div class='four columns'>
    auto c
  </div>
</div>
<div class='row'>
  <div class='two columns'>
    auto a2
  </div>
  <div class='two columns foo'>
    auto b2
  </div>
  <div class='two columns'>
    auto c2
  </div>
</div>
    HTML
  end

end
