# frozen_string_literal: true

module NumberRanges
  # Return the inclusive runs of adjacent integers in ascending order.
  def self.runs(values)
    sorted = values.map do |value|
      raise ArgumentError, "expected an integer" unless value.is_a?(Integer)

      value
    end.uniq.sort

    runs = []
    sorted.each do |number|
      if runs.empty? || number != runs.last.end + 1
        runs << (number..number)
      else
        runs[-1] = (runs.last.begin..number)
      end
    end
    runs
  end

  def self.format(values)
    runs(values).map do |run|
      run.begin == run.end ? run.begin.to_s : "#{run.begin}..#{run.end}"
    end.join(", ")
  end
end
