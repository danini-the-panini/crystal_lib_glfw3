require "./spec_helper"

describe "LibGLFW3" do
  it "works" do
    LibGLFW3.init.should eq(1)
    LibGLFW3.terminate
  end
end
