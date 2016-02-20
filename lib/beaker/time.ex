defmodule Beaker.Time do
  @moduledoc false

  def now do
    :os.system_time(:micro_seconds)
  end

  def last_full_minute do
    now = Beaker.Time.now
    remainder = rem(now, 60000000)

    now - remainder
  end

  def to_milliseconds(microseconds) do
    :erlang.convert_time_unit(microseconds, :micro_seconds, :milli_seconds)
  end

  def to_gmt(epoch_timestamp) do
    epoch_timestamp
    |> to_milliseconds
    |> :calendar.gregorian_seconds_to_datetime
  end

  def microseconds_from(minutes: minutes) when is_integer(minutes) do
    60000000 * minutes
  end
  def microseconds_from(hours: hours) when is_integer(hours) do
    microseconds_from(minutes: hours * 60)
  end
end
