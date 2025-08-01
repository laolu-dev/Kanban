package ng.tmdc.kanban.enums;

public enum DeliveryStatus {
    PENDING("Pending"),
    DELIVERED("Delivered"),
    RETURNED("Returned"),
    CANCELLED("Cancelled"),
    OUT_FOR_DELIVERY("Out for Delivery"),;

    DeliveryStatus(String name) {
        this.name = name;
    }

    private final String name;

    public String getName() {
        return name;
    }
}
