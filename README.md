# Reproduce issue with Resetting LiveView Form Programmatically

Steps to reproduce
- Run `mix.setup`
- Run `iex -S mix phx.server`
- Visit http://localhost:4000
- Fill out the form
- Press submit
- The form is not cleared but I would expect it to be cleared because I call `reset_form` which assigns a fresh `@form` assign

