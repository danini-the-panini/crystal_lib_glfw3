# Crystal LibGLFW3

libglfw3 bindings for Crystal

## Installation

Add to your `shards.yml`:

```yaml
dependencies:
  lib_glfw3:
    github: jellymann/crystal_lib_glfw3
    version: 0.1.0
```

Make sure you have [`libglfw3`](http://www.glfw.org/download.html) installed on your system

On macOS you can install with homebrew:
```shell
brew install glfw3
```

## Usage

Example code for creating a window (tested on macOS 10.11)
```ruby
require "lib_glfw3"

if LibGLFW3.init != 0
  error_callback = ->(error : Int32, description : Int8*) {
    puts "Error #{error}: #{String.new(description.as(UInt8*))}"
  }
  LibGLFW3.setErrorCallback(error_callback)

  LibGLFW3.windowHint(LibGLFW3::OPENGL_PROFILE, LibGLFW3::OPENGL_CORE_PROFILE)
  LibGLFW3.windowHint(LibGLFW3::OPENGL_FORWARD_COMPAT, 1)
  LibGLFW3.windowHint(LibGLFW3::CONTEXT_VERSION_MAJOR, 3)
  LibGLFW3.windowHint(LibGLFW3::CONTEXT_VERSION_MINOR, 3)

  window = LibGLFW3.createWindow(800, 600, "Hello Crystal!", nil, nil)

  if window
    LibGLFW3.makeContextCurrent(window)
    LibGLFW3.swapInterval(1)

    while LibGLFW3.windowShouldClose(window) == 0
      LibGLFW3.swapBuffers(window)
      LibGLFW3.pollEvents
    end

    LibGLFW3.destroyWindow(window)
  else
    puts "Failed to create window"
  end

  LibGLFW3.terminate
else
  puts "GLFW failed to initialize"
end
```

## Contributing

1. Fork it ( https://github.com/jellymann/crystal_lib_glfw3/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [jellymann](https://github.com/jellymann) Daniel Smith - creator, maintainer
