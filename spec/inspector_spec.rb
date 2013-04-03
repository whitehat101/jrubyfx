require 'spec_helper'

require 'jrubyfx/utils/inspector'

describe JRubyFX::Utils::Inspector do

  subject { Java::JavafxSceneShape::Ellipse.new 1.3, 2, 3.2, 42.0 }

  it "without inspect_properties" do
    class Java::JavafxSceneShape::Ellipse
      include JRubyFX::Utils::Inspector
    end
    subject.inspect.should match /#<Java::JavafxSceneShape::Ellipse:0x[0-9a-f]+>/
  end

  it "with blank inspect_properties" do
    class Java::JavafxSceneShape::Ellipse
      include JRubyFX::Utils::Inspector
      inspect_properties
    end
    subject.inspect.should match /#<Java::JavafxSceneShape::Ellipse:0x[0-9a-f]+>/
  end

  it "with basic inspect_properties" do
    class Java::JavafxSceneShape::Ellipse
      include JRubyFX::Utils::Inspector
      inspect_properties radiusX: :radiusX, radiusY: :radiusY
    end
    subject.inspect.should match /#<Java::JavafxSceneShape::Ellipse:0x[0-9a-f]+ radiusX:3\.2 radiusY:42\.0>/
  end

  it "with basic inspect_properties v2" do
    class Java::JavafxSceneShape::Ellipse
      include JRubyFX::Utils::Inspector
      inspect_properties foo: :radiusX, bar: :radius_y
    end
    subject.inspect.should match /#<Java::JavafxSceneShape::Ellipse:0x[0-9a-f]+ foo:3\.2 bar:42\.0>/
  end

  it "with formatted inspect_properties" do
    class Java::JavafxSceneShape::Ellipse
      include JRubyFX::Utils::Inspector
      inspect_properties radius: ["(%g,%g)",:radiusX,:radiusY]
    end
    subject.inspect.should match /#<Java::JavafxSceneShape::Ellipse:0x[0-9a-f]+ radius:\(3\.2,42\)>/
  end

end
