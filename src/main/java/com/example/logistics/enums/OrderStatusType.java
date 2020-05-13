package com.example.logistics.enums;

public enum OrderStatusType {
    WAIT_FOR_DELIVERY(1), SHIPPING(2), ARRIVED(3);

    /*1 待发货 2 配送中 3 已送达 */
    private final int code;

    OrderStatusType(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public static OrderStatusType fromCode(int code) {
        for (OrderStatusType value : values()) {
            if (value.code == code) {
                return value;
            }
        }
        throw new IllegalArgumentException("Can not matches code.");
    }
}
