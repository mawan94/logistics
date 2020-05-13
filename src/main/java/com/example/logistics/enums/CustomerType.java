package com.example.logistics.enums;

public enum CustomerType {
    ALL(0),ADMIN(1), CUSTOMER(2);

    /*1 管理人员 2 客户*/
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
