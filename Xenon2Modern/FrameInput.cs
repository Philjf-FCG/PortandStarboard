namespace Xenon2Modern;

public readonly record struct FrameInput(
    bool Left,
    bool Right,
    bool Up,
    bool Down,
    bool Fire,
    bool Confirm
);
