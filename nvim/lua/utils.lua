return {
  tables = function(t)
    return {
      includes = function(value)
        for _, v in pairs(t) do
          if v == value then return true end
        end
        return false
      end
    }
  end,
  xtables = {
    without = function(original, exclude)
      local cp = {}
      for k, v in pairs(original) do
        cp[k] = v
      end
      for _, r in pairs(exclude) do
        cp[r] = nil
      end
      return cp
    end,
    dprint = function(t)
      for k, v in pairs(t) do
        print(k, v)
      end
    end
  },
}
