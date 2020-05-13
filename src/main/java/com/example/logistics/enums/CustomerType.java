package com.example.logistics.enums;

public enum CustomerType {
    ADMIN(1), DELIVERER(2), CUSTOMER(3);

    /*1 管理人员 2 送货人员 3 客户*/
    private final int code;

    CustomerType(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public static CustomerType fromCode(int code) {
        for (CustomerType value : values()) {
            if (value.code == code) {
                return value;
            }
        }
        throw new IllegalArgumentException("Can not matches code.");
    }
}
