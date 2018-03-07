defmodule MainWebsite do
  def controller do
    quote do
      use Phoenix.Controller, namespace: MainWebsite
      import Plug.Conn
      import MainWebsite.Router.Helpers
      import MainWebsite.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/main_website/templates",
        namespace: MainWebsite

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import MainWebsite.Router.Helpers
      import MainWebsite.ErrorHelpers
      import MainWebsite.ViewHelpers
      import MainWebsite.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import MainWebsite.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
