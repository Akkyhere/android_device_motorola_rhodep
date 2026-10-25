/*
 * Copyright (C) 2024 LibreMobileOS Foundation
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include "CameraProviderExtension.h"

#include <fstream>
#include <string>

static const std::string kTorchNodes[] = {
    "/sys/devices/platform/soc/5c1b000.qcom,cci0/5c1b000.qcom,cci0:qcom,camera-flash@0/flashlight_brightness",
    "/sys/devices/platform/soc/5c1c000.qcom,cci1/5c1c000.qcom,cci1:qcom,camera-flash@2/flashlight_brightness",
};

/**
 * Write value to path and close file.
 */
template <typename T>
static void set(const std::string& path, const T& value) {
    std::ofstream file(path);
    if (!file.is_open()) {
        return;
    }
    file << value << std::endl;
}

/**
 * Read value from the path and close file.
 */
template <typename T>
static T get(const std::string& path, const T& def) {
    std::ifstream file(path);
    T result;
    if (!file.is_open()) {
        return def;
    }

    file >> result;
    return file.fail() ? def : result;
}

bool supportsTorchStrengthControlExt() {
    return true;
}

int32_t getTorchDefaultStrengthLevelExt() {
    return 60;
}

int32_t getTorchMaxStrengthLevelExt() {
    return 127;
}

int32_t getTorchStrengthLevelExt() {
    for (const auto& node : kTorchNodes) {
        int32_t val = get(node, -1);
        if (val > 0) {
            return val;
        }
    }
    return getTorchDefaultStrengthLevelExt();
}

void setTorchStrengthLevelExt(int32_t torchStrength, bool enabled) {
    if (!enabled) {
        return;
    }
    for (const auto& node : kTorchNodes) {
        set(node, torchStrength);
    }
}
