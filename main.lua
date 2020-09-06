function printHello(printString)
    print(printString)
end
 
printHello("01 Hello Lua!!")


-- 定義協同函數
add_type1=coroutine.create(
    function(a,b)
        print("02 a + b = ",a+b)
        -- 查看協程的運行狀態
        print("coroutine.status(add_type1):",coroutine.status(add_type1))
        coroutine.yield() -- 暫停協同函數
        print("03 a + b = ",a-b)
        print("coroutine.running(): ",coroutine.running())
        local test = "end"
        return a/b,test
    end
)

-- 啟動協定函數
coroutine.resume(add_type1,20,30)


-- 使用wrap定義協同函數
add_type2=coroutine.wrap(
    function(a,b)
        print("05 a * b = ",a*b)
    end
)

add_type2(50,60)

print("06 I am here!")

print("coroutine.running(): ",coroutine.running())
print("coroutine.status(add_type1):",coroutine.status(add_type1))
res1,res2,res3 = coroutine.resume(add_type1) -- 繼續運行被暫停的協程
print("04 reciveOK:",res1,"a / b = ",res2," ",res3)

