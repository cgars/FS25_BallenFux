-- BallenFux - No Bale Consumables specialization
-- Suppresses only the three bale-related consumable types provided by the game.
-- Other consumables and ordinary fill units are deliberately left untouched.

NoBaleConsumables = {}

function NoBaleConsumables.prerequisitesPresent(specializations)
    if Consumable == nil
        or not SpecializationUtil.hasSpecialization(Consumable, specializations) then
        return false
    end

    return (Baler ~= nil and SpecializationUtil.hasSpecialization(Baler, specializations))
        or (BaleWrapper ~= nil and SpecializationUtil.hasSpecialization(BaleWrapper, specializations))
        or (InlineWrapper ~= nil and SpecializationUtil.hasSpecialization(InlineWrapper, specializations))
end

function NoBaleConsumables.registerOverwrittenFunctions(vehicleType)
    SpecializationUtil.registerOverwrittenFunction(
        vehicleType,
        "updateConsumable",
        NoBaleConsumables.updateConsumable
    )
    SpecializationUtil.registerOverwrittenFunction(
        vehicleType,
        "getConsumableIsAvailable",
        NoBaleConsumables.getConsumableIsAvailable
    )
    SpecializationUtil.registerOverwrittenFunction(
        vehicleType,
        "getShowConsumableEmptyWarning",
        NoBaleConsumables.getShowConsumableEmptyWarning
    )
end

function NoBaleConsumables.isBaleConsumable(typeName)
    if typeName == nil then
        return false
    end

    if Baler ~= nil then
        if typeName == Baler.CONSUMABLE_TYPE_NAME_ROUND
            or typeName == Baler.CONSUMABLE_TYPE_NAME_SQUARE then
            return true
        end
    end

    if BaleWrapper ~= nil and typeName == BaleWrapper.CONSUMABLE_TYPE_NAME then
        return true
    end

    if InlineWrapper ~= nil and typeName == InlineWrapper.CONSUMABLE_TYPE_NAME then
        return true
    end

    return false
end

function NoBaleConsumables.updateConsumable(self, superFunc, typeName, delta, ...)
    if NoBaleConsumables.isBaleConsumable(typeName)
        and delta ~= nil
        and delta < 0 then
        delta = 0
    end

    return superFunc(self, typeName, delta, ...)
end

function NoBaleConsumables.getConsumableIsAvailable(self, superFunc, typeName, ...)
    if NoBaleConsumables.isBaleConsumable(typeName) then
        return true
    end

    return superFunc(self, typeName, ...)
end

function NoBaleConsumables.getShowConsumableEmptyWarning(self, superFunc, typeName, ...)
    if NoBaleConsumables.isBaleConsumable(typeName) then
        return false
    end

    return superFunc(self, typeName, ...)
end
