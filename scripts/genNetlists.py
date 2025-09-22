import os

tfe = 5e-9
Ea = 3.74e8 / 6e-9 * tfe
Pr = 32.3 * (1 - (1 / (1 + (tfe / 8.5e-9) ** 3.96))) + 1.5037
original_file = "./origin/input.ckt"
output_path = "../netlists/"

# Read the content of the input file
with open(original_file, 'r') as file:
    fileContent = file.read()

newFile_tmp1 = fileContent.replace("MC_TFE ", f"{tfe} ")
newFile_tmp2 = newFile_tmp1.replace("MC_PR ", f"{Pr} ")
newFile_tmp3 = newFile_tmp2.replace("MC_Ea ", f"{Ea} ")

tp_values = [round(i * 2e-9, 10) for i in range(1, int(30e-9 / 2e-9) + 2)]
vp_values = [round(1 + i * 0.2, 1) for i in range(int((5 - 1) / 0.2) + 1)]

for tp in tp_values:
    for vp in vp_values:
        newFile_tmp4 = newFile_tmp3.replace("MC_tp ", f"{tp:.1e} ")
        newFile_tmp5 = newFile_tmp4.replace("MC_vp ", f"{vp:.1f} ")
        outputFilePath = os.path.join(output_path, f"mc_tp{tp * 1e9:.0f}_vp_{vp:.1f}.sp")
        
        with open(outputFilePath, 'w') as file:
            file.write(newFile_tmp5)

