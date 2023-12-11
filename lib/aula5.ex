defmodule Aula5 do
  def ins(num, []), do: [num]
  def ins(num, [h | t]) do
    if num > h do
      [h | ins(num, t)]
    else
      [num | [h | t]]
    end
  end

  def ins_no_rep(num, []), do: [num]
  def ins_no_rep(num, [h | t]) do
    cond do
      num > h -> [h | ins_no_rep(num, t)]
      num < h -> [num | [h | t]]
      true -> [h | t]
    end
  end

  def ins_dec(num, []), do: [num]
  def ins_dec(num, [h | t]) do
    cond do
      num < h -> [h | ins_dec(num, t)]
      num >= h -> [num | [h | t]]
    end
  end

  def insertion_sort([]), do: []
  def insertion_sort([h | t]) do
    ins_dec(h, insertion_sort(t))
  end

  def menor(list) do
    if is_list(list) do
      hd(insertion_sort(list))
    else
      raise("Essa função recebe uma lista!")
    end
  end

  defp get_last([h]), do: h
  defp get_last([_ | t]) do
    get_last(t)
  end

  def maior(list) do
    if is_list(list) do
      get_last(insertion_sort(list))
    else
      raise("Essa função recebe uma lista!")
    end
  end

  def membro(_, []), do: false
  def membro(val, [h | t]) do
    cond do
      val == h -> true
      true -> membro(val, t)
    end
  end

  def quantas_vezes(_, []), do: 0
  def quantas_vezes(el, [h | t]) do
    cond do
      el == h -> 1 + quantas_vezes(el, t)
      true -> quantas_vezes(el, t)
    end
  end

  def membro_2(val, l) when is_list(l) do
    cond do
      quantas_vezes(val, l) > 0 -> true
      true -> false
    end
  end

  defp unicos_([], _), do: []
  defp unicos_([h | t], l) do
    cond do
      quantas_vezes(h, l) == 1 -> [h | unicos_(t, l)]
      true -> unicos_(t, l)
    end
  end
  def unicos(l) do
    unicos_(l,l)
  end

  def unicos_2([]), do: []
  def unicos_2([h | t]) do
    cond do
      quantas_vezes(h, t) > 0 -> unicos_2(remove_all_ocurrences(h, t))
      true -> [h | unicos_2(t)]
    end
  end

  defp remove_all_ocurrences(_val, []), do: []
  defp remove_all_ocurrences(val, [h | t]) do
    if val == h do
      remove_all_ocurrences(val, t)
    else
      [h | remove_all_ocurrences(val, t)]
    end
  end

  def quick_sort([]), do: []
  def quick_sort([h|t]) do
    quick_sort(menores(h,t)) ++ [h] ++ quick_sort(maiores(h,t))
  end

  def menores(_val, []), do: []
  def menores(val, [h | t]) do
    if h <= val do
      [h | menores(val, t)]
    else
      menores(val, t)
    end
  end

  def maiores(_val, []), do: []
  def maiores(val, [h | t]) do
    if h > val do
      [h | maiores(val, t)]
    else
      maiores(val, t)
    end
  end
end
