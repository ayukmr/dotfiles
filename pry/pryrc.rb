# ================
# === Pry Init ===
# ================

# string utils
class String
  # color string
  def black;     "\e[30m#{self}\e[0m" end
  def red;       "\e[31m#{self}\e[0m" end
  def green;     "\e[32m#{self}\e[0m" end
  def yellow;    "\e[33m#{self}\e[0m" end
  def blue;      "\e[34m#{self}\e[0m" end
  def magenta;   "\e[35m#{self}\e[0m" end
  def cyan;      "\e[36m#{self}\e[0m" end

  # format string
  def bold;      "\e[1m#{self}\e[22m" end
  def italic;    "\e[3m#{self}\e[23m" end
  def underline; "\e[4m#{self}\e[24m" end
end

# prompt
Pry.config.prompt = Pry::Prompt.new(
  'default',
  'default prompt',
  [
    proc { |obj, nest| "#{obj.to_s.red.bold}:#{nest.to_s.blue}> " },
    proc { |obj, nest| "#{obj.to_s.red.bold}:#{nest.to_s.blue}* " }
  ]
)

# copy to clipboard
def pbcopy(input)
  str = input.to_s
  IO.popen('pbcopy', 'w') { |f| f << str }
  str
end

# get clipboard value
def pbpaste
  `pbpaste`
end

# object utils
class Object
  # read documentation for method
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/
      cls = is_a?(Class) ? name : self.class.name
      method = [cls, method].compact.join('#')
    end

    system 'ri', method.to_s
  end
end
