package com.christosmetrics.infrastructure.security;

/** Levée quand le rate limit est dépassé. Mappée en 429 Too Many Requests. */
public class TrafficExcessif extends RuntimeException {
    public TrafficExcessif(String message) { super(message); }
}
