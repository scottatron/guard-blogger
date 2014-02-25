module Blogger
  module Helpers

    ESCAPE_MAP = { '\\' => '\\\\', '</' => '<\/', "\r\n" => '\n', "\n" => '\n', "\r" => '\n', '"' => '\\"', "'" => "\\'" }

    def escape_template(template)
      if template
        template.gsub(/(\|<\/|\r\n|\342\200\250|\342\200\251|[\n\r"'])/u) {|match| ESCAPE_MAP[match] }
      else
        ''
      end
    end

    DEFAULT_TEMPLATE = <<-eos
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html>
<html>
<head>
  <b:skin></b:skin>
</head>
<body>
<b:section id='main'>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</b:section>
</body>
</html>
    eos

    def default_template
      escape_template(DEFAULT_TEMPLATE)
    end

  end
end
