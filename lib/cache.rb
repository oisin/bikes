class Cache

  def initialize(source, fetchm, exp=86400)
    @expiry = exp
    @timestamp = 0
    @contents = []
    @source = source
    @fetch = fetchm
  end

  def contents
    if expired?
      put(@source.send(@fetch))
    end
    @contents
  end

  def put(stuff)
    @timestamp = Time.now.utc.to_i
    @contents = stuff
  end
  
  def expired?
    (Time.now.utc.to_i - @timestamp) > @expiry
  end
end
