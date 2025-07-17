using HDF5, JLD

function Data_Generation(JOB, MACHINE, FACTORY, SJ, index)

    p = rand(10:30, JOB, MACHINE, FACTORY)

    SPECIAL_JOB_NUM = 0
    SPECIAL_JOB = Array{Bool}(undef, JOB)
    # Initialize SPECIAL_JOB
    for j in 1:JOB
        SPECIAL_JOB[j] = 0
    end
    for j in 1:JOB
        if rand() < SJ
            SPECIAL_JOB[j] = 1
            SPECIAL_JOB_NUM = SPECIAL_JOB_NUM + 1
        end
    end

    println("SPECIAL_JOB = $SPECIAL_JOB")

    println("p = $p")

    filenm = join(["Data/DHPFSP_S/Ins_", string(JOB), "_", string(MACHINE), "_", string(FACTORY), "_", string(SJ), "_", string(index), ".jld"])
    save(filenm, "JJ", JOB, "MM", MACHINE, "pp", p, "FF", FACTORY, "SS", SPECIAL_JOB)
end

for J in 5:9
    for M in [5]
        for F in [3,4]
            for SJ in [0.2]
                for i in [1,2,3,4]
                    Data_Generation(J, M, F, SJ, i)
                end
            end
        end
    end
end
