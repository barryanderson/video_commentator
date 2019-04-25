defmodule VideoCommentatorWeb.InputHelpers do
  use Phoenix.HTML

  def input(form, field, opts \\ []) do
    type = opts[:using] || Phoenix.HTML.Form.input_type(form, field)

    wrapper_opts = [class: "form-group"]
    label_opts = [class: "control-label"]
    input_opts = [class: "form-control #{state_class(form, field)}"]

    content_tag :div, wrapper_opts do
      label = label(form, field, humanize(field), label_opts)
      input = apply(Phoenix.HTML.Form, type, [form, field, input_opts])
      error = VideoCommentatorWeb.ErrorHelpers.error_tag(form, field)
      [label, input, error || ""]
    end
  end

  defp state_class(form, field) do
    state_class(form.source, form.errors, field)
  end

  defp state_class(%Ecto.Changeset{} = source, errors, field) do
    cond do
      # The form was not yet submitted
      !source.action -> ""
      errors[field] -> "is-invalid"
      true -> "is-valid"
    end
  end

  defp state_class(%Plug.Conn{} = _source, _errors, _field), do: ""

  # Implement clauses below for custom inputs.
  # defp input(:datepicker, form, field, input_opts) do
  #   raise "not yet implemented"
  # end
  defp input(type, form, field, input_opts) do
    apply(Phoenix.HTML.Form, type, [form, field, input_opts])
  end
end
