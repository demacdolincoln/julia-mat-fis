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
    return coprime
end

# calcular D
D = invmod(E, ϕ)
# criptografar

# descriptografar
