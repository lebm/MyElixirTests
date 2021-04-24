gen_prefix = fn prefix -> (fn sufix -> "#{prefix} #{sufix}" end) end

mr = gen_prefix.("Mr")
ms = gen_prefix.("Ms")

IO.puts mr.("Luis")
IO.puts ms.("Emilia")
