# ================
# === Pry Init ===
# ================

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

# pry prompt
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

# create file or directory
Pry::Commands.create_command 'mk' do
  description 'Create a file or directory'

  # banner for `help mk`
  banner <<-BANNER
    Usage: mk [-d] [-c <CONTENTS>] <PATH>

    Create a file or directory at the given path,
    optionally setting the file contents.
  BANNER

  def setup
    @contents = nil
  end

  def options(opt)
    opt.on :d, :directory, 'Create a directory instead of a file.'
    opt.on :c, :contents, 'Set contents of created file.', true do |contents|
      @contents = contents
    end
  end

  def process
    args.each do |path|
      path = File.expand_path(path)

      # error on contents given for directory
      raise Pry::CommandError, '-c and -d are not compatible with each other' if opts.d? && opts.c?
      # error if file or directory already exists
      raise Pry::CommandError, 'file or directory already exists at given path' if File.exist?(path)

      if opts.directory?
        Dir.mkdir(path)
      else
        File.open(path, 'w') do |file|
          # write to file if contents are given
          file.write(@contents) if @contents
        end
      end
    end
  end
end
