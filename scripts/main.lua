-- BallenFux - No Bale Consumables
-- Registers a lightweight specialization on every vehicle type that combines
-- the Consumable specialization with a baler or bale-wrapper specialization.

local modName = g_currentModName
local modDirectory = g_currentModDirectory
local specializationName = modName .. ".noBaleConsumables"

local function hasSpecialization(specialization, specializations)
    return specialization ~= nil
        and SpecializationUtil.hasSpecialization(specialization, specializations)
end

local function injectIntoVehicleTypes(typeManager)
    if typeManager.typeName ~= "vehicle" then
        return
    end

    local inserted = 0

    for vehicleTypeName, vehicleType in pairs(g_vehicleTypeManager.types) do
        local specializations = vehicleType.specializations
        local isBaleMachine = hasSpecialization(Baler, specializations)
            or hasSpecialization(BaleWrapper, specializations)
            or hasSpecialization(InlineWrapper, specializations)

        if hasSpecialization(Consumable, specializations) and isBaleMachine then
            g_vehicleTypeManager:addSpecialization(vehicleTypeName, specializationName)
            inserted = inserted + 1
        end
    end

    Logging.info("[BallenFux] Activated for %d vehicle types", inserted)
end

g_specializationManager:addSpecialization(
    "noBaleConsumables",
    "NoBaleConsumables",
    Utils.getFilename("scripts/NoBaleConsumables.lua", modDirectory),
    nil
)

TypeManager.validateTypes = Utils.appendedFunction(TypeManager.validateTypes, injectIntoVehicleTypes)
