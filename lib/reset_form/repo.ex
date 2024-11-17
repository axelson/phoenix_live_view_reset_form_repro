defmodule ResetForm.Repo do
  use Ecto.Repo,
    otp_app: :reset_form,
    adapter: Ecto.Adapters.SQLite3
end
