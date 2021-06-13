require "sdl"
require "imgui"

{% if flag?(:darwin) %}
  @[Link(framework: "OpenGL")]
  @[Link(framework: "CoreFoundation")]
{% elsif flag?(:win32) %}
  @[Link("OpenGL32")]
{% else %}
  @[Link("GL")]
{% end %}
@[Link("cimgui")]
{% if flag?(:win32) %}
  @[Link(ldflags: "/LIBPATH:#{__DIR__}\\..\\cimgui")]
{% else %}
  @[Link("stdc++")]
  @[Link(ldflags: "-L#{__DIR__}/../cimgui")]
{% end %}
@[Link(ldflags: "#{__DIR__}/../*.o")]
lib LibImGuiBackends
  # SDL2
  fun ImGui_ImplSDL2_InitForOpenGL = Crystal_ImGui_ImplSDL2_InitForOpenGL(window : LibSDL::Window*, gl_context : LibSDL::GLContext) : Bool
  fun ImGui_ImplSDL2_NewFrame = Crystal_ImGui_ImplSDL2_NewFrame(window : LibSDL::Window*)
  fun ImGui_ImplSDL2_ProcessEvent = Crystal_ImGui_ImplSDL2_ProcessEvent(event : LibSDL::Event*) : Bool
  fun ImGui_ImplSDL2_Shutdown = Crystal_ImGui_ImplSDL2_Shutdown

  # OpenGL3
  fun ImGui_ImplOpenGL3_Init = Crystal_ImGui_ImplOpenGL3_Init(glsl_version : UInt8*) : Bool
  fun ImGui_ImplOpenGL3_NewFrame = Crystal_ImGui_ImplOpenGL3_NewFrame
  fun ImGui_ImplOpenGL3_RenderDrawData = Crystal_ImGui_ImplOpenGL3_RenderDrawData(draw_data : Void*)
  fun ImGui_ImplOpenGL3_Shutdown = Crystal_ImGui_ImplOpenGL3_Shutdown

  # Misc
  fun gl3wInit
end
