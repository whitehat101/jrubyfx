require 'jrubyfx/utils/inspector'

# Inject the Inspector into all JavaFX Node descendants (most objects)
Java::JavafxScene::Node.send :include, JRubyFX::Utils::Inspector


# Java::JavafxSceneText::Text.inspect_properties(
#   x: :x,
#   y: :y,
#   text: :text,
#   textAlignment: :textAlignment,
#   font: :font,
#   underline: :underline,
#   lineSpacing: :lineSpacing,
#   textOrigin: :textOrigin,
#   boundsType: :boundsType,
#   wrappingWidth: :wrappingWidth,
#   strikethrough: :strikethrough,
#   fontSmoothingType: :fontSmoothingType
# )
