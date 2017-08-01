# Pkg.add("Primes")
using Primes

# gerar p e q
p, q = rand(Primes.PRIMES[20:50],2)
# calcular N
N = p * q
# calcular ϕ
ϕ = (p-1) * (q-1)
# encontrar E
function mdc(a, b)
    if b == 0
        return a
    else
        mdc(b, a % b)
    end
end

E = begin
    coprime = 0
    cont = 2
    while coprime == 0
        if mdc(cont, ϕ) == 1
            coprime = cont
        end
        cont += 1
    end
    coprime
end

# calcular D
D = invmod(E, ϕ)
# criptografar
println("################################")
println("""p, q = $p, $q
N = $N
ϕ = $ϕ
E = $E
D = $D
""")
println("################################")

println("digite uma mensagem abaixo:")
msg = readline()

msgCript = [(BigInt(letra)^E % N) for letra in msg]
println(msgCript)
# descriptografar
msgDec = join(map(x -> Char(x^D % N), msgCript))
println(msgDec)
