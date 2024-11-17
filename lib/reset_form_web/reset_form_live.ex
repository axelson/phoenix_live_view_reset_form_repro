defmodule ResetFormWeb.ResetFormLive do
  use ResetFormWeb, :live_view

  defmodule MyForm do
    use Ecto.Schema

    @primary_key false
    embedded_schema do
      field :note, :string
      field :amount, :string
    end
  end

  def reset_form(socket) do
    assign(socket,
      form:
        %MyForm{}
        |> Ecto.Changeset.change()
        |> Phoenix.Component.to_form()
    )
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    socket =
      socket
      |> reset_form()

    {:ok, socket, layout: false}
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    IO.inspect(assigns.form, label: "assigns.form")

    ~H"""
    <div class="w-full max-w-md mx-auto p-4">
      <div className="relative">
        <.form for={@form} phx-change="validate" phx-submit="submit">
          <.input
            id="note-input"
            field={@form[:note]}
            class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 bg-white shadow-sm transition-colors duration-200"
            type="text"
            placeholder="Note"
          />
          <.input
            id="amount-input"
            field={@form[:amount]}
            type="text"
            inputmode="decimal"
            placeholder="amount"
          />

          <.button>Send!</.button>
          <button type="reset" name="reset">Reset</button>
        </.form>
      </div>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def handle_event("validate", params, socket) do
    IO.inspect(params, label: "params")
    socket = reset_form(socket)

    {:noreply, socket}
  end

  def handle_event("submit", params, socket) do
    IO.inspect(params, label: "submit params")

    socket = reset_form(socket)

    {:noreply, socket}
  end
end
