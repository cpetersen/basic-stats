require "basic/stats/version"

module Basic
  module Stats
    def sum
      self.inject(0){|accum, i| accum + i }
    end

    def mean
      self.sum/self.length.to_f
    end

    def median
      sorted = self.sort
      len = sorted.length
      return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end

    def sample_variance
      m = self.mean
      sum = self.inject(0){|accum, i| accum +(i-m)**2 }
      sum/(self.length - 1).to_f
    end

    def standard_deviation
      return Math.sqrt(self.sample_variance)
    end

    def z(value)
      (self.mean - value).abs/standard_deviation
    end

    def critical_z
      Stats.critical_z(self.size)
    end

    def reject_outliers
      cz = self.critical_z
      self.reject { |value| z(value) > cz }
    end

    def reject_outliers!
      cz = self.critical_z
      self.reject! { |value| z(value) > cz }
    end

    def select_outliers
      cz = self.critical_z
      self.select { |value| z(value) > cz }
    end

    @@critical_z_table = {
      3 => 1.15,
      4 => 1.48,
      5 => 1.71,
      6 => 1.89,
      7 => 2.02,
      8 => 2.13,
      9 => 2.21,
      10 => 2.29,
      11 => 2.34,
      12 => 2.41,
      13 => 2.46,
      14 => 2.51,
      15 => 2.55,
      16 => 2.59,
      17 => 2.62,
      18 => 2.65,
      19 => 2.68,
      20 => 2.71,
      21 => 2.73,
      22 => 2.76,
      23 => 2.78,
      24 => 2.80,
      25 => 2.82,
      26 => 2.84,
      27 => 2.86,
      28 => 2.88,
      29 => 2.89,
      30 => 2.91,
      31 => 2.92,
      32 => 2.94,
      33 => 2.95,
      34 => 2.97,
      35 => 2.98,
      36 => 2.99,
      37 => 3.00,
      38 => 3.01,
      39 => 3.03,
      40 => 3.04,
      50 => 3.13,
      60 => 3.20,
      70 => 3.26,
      80 => 3.31,
      90 => 3.35,
      100 => 3.38,
      110 => 3.42,
      120 => 3.44,
      130 => 3.47,
      140 => 3.49
    }

    def self.critical_z(n)
      result = nil
      @@critical_z_table.keys.sort.each do |key|
        break if key > n
        result = @@critical_z_table[key]
      end
      result
    end
  end
end
