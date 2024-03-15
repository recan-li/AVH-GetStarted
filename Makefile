
AVH_GETSTARTED_PRO_PATH := basic


all: clean build run


build:
	@echo "Building basic.debug.cprj MDK project ..."
	cbuild --packs $(AVH_GETSTARTED_PRO_PATH)/basic.debug.cprj

clean:
	@echo "Remove object files ..."
	rm -rf $(AVH_GETSTARTED_PRO_PATH)/Objects/

run: $(AVH_GETSTARTED_PRO_PATH)/Objects/basic.elf
	@echo "Running elf files ..."
	VHT_Corstone_SSE-300_Ethos-U55 -q --stat --simlimit 1 -f $(AVH_GETSTARTED_PRO_PATH)/fvp_config.txt $(AVH_GETSTARTED_PRO_PATH)/Objects/basic.elf

.PHONY: all build clean run
