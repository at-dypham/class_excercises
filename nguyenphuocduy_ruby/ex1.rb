require 'pry'
hashh={'name'=> "trang", name: "duy", subhash: { name: "anh"}}
arr=[]
hashh.collect{|i, j|
  if j.class.to_s=="Hash"

    j.collect {|k, l|
      h= {k=>l}
      arr.push(h)
    }
  else
    a={i=>j}
    arr.push(a)

  end
}
print arr

